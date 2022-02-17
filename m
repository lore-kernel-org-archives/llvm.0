Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43D38E2
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 00:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645059562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eU/Mifbu4etylHTsMKrowLFS/TabOtITNkaHH9/HGA0=;
	b=Fjbm5huf2ZQuMRDsiqZd65LlwTg8e+yGWRQEgSI20tb/EhdgjA22woSFYZBXfIGZwmAUm8
	zkr56nBC7ZCFLWnEHkyvrbZDmwkrAHjepAxxMwgNv7E3hUfrrA6XQh/Ae9YnycIOkVps2D
	kDttSBCIkrb2Jjhsx3g2jiOn0ssHLrc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-qULU-zWmMyehQZMspbF1MQ-1; Wed, 16 Feb 2022 19:59:18 -0500
X-MC-Unique: qULU-zWmMyehQZMspbF1MQ-1
Received: by mail-pg1-f199.google.com with SMTP id a18-20020a656052000000b00371d6702c59so2046829pgp.15
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 16:59:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=eU/Mifbu4etylHTsMKrowLFS/TabOtITNkaHH9/HGA0=;
        b=aPmHsZZAxiJFEMQK5ow7CtSMQOccV2xUDPMZ/j0ZY3QSneZKUMcUTsFD+odkvcOOFm
         zFHMiSHn8wRpPcRAu5K/hOuV9gNDgSoRKkGGBklsbzSBfxmHbUu2XNHM2s9+YTMCwQJ5
         NWvjOwzL2KmDDLCZ5ctB9RE93esuzXMxIKC7sujJf51jkEtr3rq0BLY2/23SojBTJp0W
         p5VAQT8fHB3Gv5JSztECUKVUWh9quAzxPZOwmc/JtkY8m4BxFawR3ctcx/iNAyHCLEh4
         eTdV7N+IEF5hgFyNXllJbjCUTVAsxY5wuCvDWPP263q2iV4x+jem5J6pI7ONqwjd7Yau
         2v9Q==
X-Gm-Message-State: AOAM531EZ0feDodpz9C/ql2+4yjwBWY1VwN/Zz5XhZU5MkSmvrBWc70p
	k+2RRkH9uqV3/gBaTQbqeZKs0hCaih640ywoNGA6+fElkgUtW7ZLR4YAwsRur6jv1YF+okmuY5D
	73pSNB5PSrjVQug==
X-Received: by 2002:a17:90a:7385:b0:1b9:6492:c107 with SMTP id j5-20020a17090a738500b001b96492c107mr486841pjg.103.1645059557875;
        Wed, 16 Feb 2022 16:59:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxOfRgZ4aDneinmcCs8KxAfjPbb1usuXhIBXsFT/4HhFw/q1qjE01kLH0IDhdmV8ez1iQrMQ==
X-Received: by 2002:a17:90a:7385:b0:1b9:6492:c107 with SMTP id j5-20020a17090a738500b001b96492c107mr486826pjg.103.1645059557613;
        Wed, 16 Feb 2022 16:59:17 -0800 (PST)
Received: from [10.72.12.153] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id s40sm3123007pfg.145.2022.02.16.16.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 16:59:16 -0800 (PST)
Subject: Re: [ceph-client:testing 13/14] fs/ceph/snap.c:438:14: warning:
 variable '_realm' is uninitialized when used here
To: Jeff Layton <jlayton@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, ceph-devel@vger.kernel.org
References: <202202170318.82LIXBXX-lkp@intel.com>
 <8d84c25fa277988b36969f1d08543aec8183d7c3.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <40416149-19f3-3719-f7ba-1457d305e2a3@redhat.com>
Date: Thu, 17 Feb 2022 08:59:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8d84c25fa277988b36969f1d08543aec8183d7c3.camel@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/17/22 3:52 AM, Jeff Layton wrote:
> On Thu, 2022-02-17 at 03:33 +0800, kernel test robot wrote:
>> tree:   https://github.com/ceph/ceph-client.git testing
>> head:   91e59cfc6ca1a2bf594f60474996c71047edd1e5
>> commit: 7c7e63bc9910b15ffd1f791838ff0a919058f97c [13/14] ceph: eliminate the recursion when rebuilding the snap context
>> config: hexagon-randconfig-r005-20220216 (https://download.01.org/0day-ci/archive/20220217/202202170318.82LIXBXX-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/ceph/ceph-client/commit/7c7e63bc9910b15ffd1f791838ff0a919058f97c
>>          git remote add ceph-client https://github.com/ceph/ceph-client.git
>>          git fetch --no-tags ceph-client testing
>>          git checkout 7c7e63bc9910b15ffd1f791838ff0a919058f97c
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/ceph/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> fs/ceph/snap.c:438:14: warning: variable '_realm' is uninitialized when used here [-Wuninitialized]
>>                             list_del(&_realm->rebuild_item);
>>                                       ^~~~~~
>>     fs/ceph/snap.c:430:33: note: initialize the variable '_realm' to silence this warning
>>                     struct ceph_snap_realm *_realm, *child;
>>                                                   ^
>>                                                    = NULL
>>     1 warning generated.
>>
>>
>> vim +/_realm +438 fs/ceph/snap.c
>>
>>     417	
>>     418	/*
>>     419	 * rebuild snap context for the given realm and all of its children.
>>     420	 */
>>     421	static void rebuild_snap_realms(struct ceph_snap_realm *realm,
>>     422					struct list_head *dirty_realms)
>>     423	{
>>     424		LIST_HEAD(realm_queue);
>>     425		int last = 0;
>>     426	
>>     427		list_add_tail(&realm->rebuild_item, &realm_queue);
>>     428	
>>     429		while (!list_empty(&realm_queue)) {
>>     430			struct ceph_snap_realm *_realm, *child;
>>     431	
>>     432			/*
>>     433			 * If the last building failed dues to memory
>>     434			 * issue, just empty the realm_queue and return
>>     435			 * to avoid infinite loop.
>>     436			 */
>>     437			if (last < 0) {
>>   > 438				list_del(&_realm->rebuild_item);
>>     439				continue;
>>     440			}
>>     441	
>>     442			_realm = list_first_entry(&realm_queue,
>>     443						  struct ceph_snap_realm,
>>     444						  rebuild_item);
> Xiubo, I think we just need to move this assignment of _realm above the
> previous if block. I've made that change in-tree. Please take a look and
> make sure it looks OK to you.
>
Look good to me.

Thanks.

>>     445			last = build_snap_context(_realm, &realm_queue, dirty_realms);
>>     446			dout("rebuild_snap_realms %llx %p, %s\n", _realm->ino, _realm,
>>     447			     last > 0 ? "is deferred" : !last ? "succeeded" : "failed");
>>     448	
>>     449			list_for_each_entry(child, &_realm->children, child_item)
>>     450				list_add_tail(&child->rebuild_item, &realm_queue);
>>     451	
>>     452			/* last == 1 means need to build parent first */
>>     453			if (last <= 0)
>>     454				list_del(&_realm->rebuild_item);
>>     455		}
>>     456	}
>>     457	
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> Thanks, KTR!

