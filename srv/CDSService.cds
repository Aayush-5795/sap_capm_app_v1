
using { aayush.views } from '../db/CDSViews';

service CDSService @(path: 'CDSService'){

    entity ProductSet as projection on views.CDSViews.ProductView{
        *,
        virtual soldCount: Int16 
    };
    entity ItemsSet as projection on views.CDSViews.ItemView;
}
