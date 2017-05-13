function dataset = kaist_lwir_test(dataset, usage)

switch usage
    case {'train'}
        dataset.imdb_train    = {  imdb_from_kaist_lwir('./datasets/kaist_lwir', 'test', true) };
        dataset.roidb_train   = cellfun(@(x) x.roidb_func(x, true), dataset.imdb_train, 'UniformOutput', false);
    case {'test'}
        dataset.imdb_test     = imdb_from_kaist_lwir('./datasets/kaist_lwir', 'test', false) ;
        dataset.roidb_test    = dataset.imdb_test.roidb_func(dataset.imdb_test, false);
    otherwise
        error('usage = ''train'' or ''test''');
end

end