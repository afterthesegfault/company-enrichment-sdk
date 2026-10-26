import { BaseFeature } from './feature/base/BaseFeature';
declare const FEATURE_PLUGINS: Record<string, any[]>;
declare class Config {
    makeFeature(this: any, fn: string): BaseFeature;
    hasFeature(this: any, fn: string): boolean;
    main: {
        name: string;
        slug: string;
        version: string;
        target: string;
    };
    feature: {
        netsim: {
            options: {
                active: boolean;
                errorTimes: number;
                failEvery: number;
                failRate: number;
                failStatus: number;
                failTimes: number;
                latency: number;
                offline: boolean;
                rateLimitTimes: number;
                retryAfter: number;
                seed: number;
            };
            optspec: {
                latency: string[];
                sleep: string;
            };
            strict: boolean;
            transport: string;
        };
        test: {
            options: {
                active: boolean;
            };
            optspec: {
                entity: string;
                net: string;
            };
            strict: boolean;
            transport: string;
        };
    };
    options: {
        base: string;
        auth: {
            prefix: string;
            in: string;
            name: string;
        };
        headers: {
            "content-type": string;
        };
        entity: {
            get_company_enrichment: {};
            post_company_enrichment: {};
        };
    };
    entity: {
        get_company_enrichment: {
            fields: {
                name: string;
                title: string;
                type: string;
                short: string;
            }[];
            name: string;
            op: {
                list: {
                    input: string;
                    name: string;
                    points: {
                        kind: string;
                        method: string;
                        orig: string;
                        segments: never[];
                        parts: never[];
                        rename: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        args: {
                            query: ({
                                name: string;
                                orig: string;
                                type: string;
                                kind: string;
                                reqd: boolean;
                                example: string;
                                field: boolean;
                            } | {
                                name: string;
                                orig: string;
                                type: string;
                                kind: string;
                                example: string;
                                reqd?: undefined;
                                field?: undefined;
                            })[];
                        };
                        select: {
                            exist: string[];
                        };
                        response: {
                            kind: string;
                            media: string;
                        };
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
        post_company_enrichment: {
            fields: ({
                name: string;
                title: string;
                type: string;
                short: string;
                op?: undefined;
            } | {
                name: string;
                title: string;
                type: string;
                op: {
                    create: {
                        req: boolean;
                        type: string;
                    };
                };
                short: string;
            })[];
            name: string;
            op: {
                create: {
                    input: string;
                    name: string;
                    points: {
                        kind: string;
                        method: string;
                        orig: string;
                        segments: never[];
                        parts: never[];
                        rename: {};
                        transform: {
                            req: string;
                            res: string;
                        };
                        args: {};
                        select: {};
                        body: {
                            alternatives: {
                                fields: {
                                    name: string;
                                }[];
                                kind: string;
                                media: string;
                            }[];
                            kind: string;
                            media: string;
                        };
                        response: {
                            kind: string;
                            media: string;
                        };
                    }[];
                };
            };
            relations: {
                ancestors: never[];
            };
        };
    };
}
declare const config: Config;
export { config, FEATURE_PLUGINS, };
