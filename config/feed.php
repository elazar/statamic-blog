<?php

use Spatie\Feed\FeedItem;
use Statamic\Entries\Entry;
use Statamic\Facades\User;

return [
    'feeds' => [
        'main' => [
            'items' => fn() => Entry::query()
                ->where('collection', 'articles')
                ->where('published', true)
                ->where('date', '<=', now())
                ->orderBy('date', 'desc')
                ->orderBy('title')
                ->limit(20)
                ->get()
                ->map(function(Entry $entry): FeedItem {
                    return FeedItem::create([
                        'id' => $entry->url(),
                        'title' => $entry->get('title'),
                        'summary' => $entry->excerpt ?? '',
                        'updated' => $entry->date(),
                        'link' => $entry->url(),
                        'author' => implode(', ', $entry->authors()->map(
                            fn($id) => User::find($id)->name
                        )->all()),
                    ]);
                }),
            'url' => '/feed.xml',
            'title' => 'Matthew Turland',
            'description' => 'Blog posts from matthewturland.com',
            'language' => 'en-US',
            'view' => 'feed::feed',
        ],
    ],
];
