Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C9120FE
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 12:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693742823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ww/X9A++x5CfrbV8/KeMYfQ017da0o9tfjIpanjcu1A=;
	b=gYIHUzJIXKocEn1kdMKrMDOjyXm1JIyMZ8gefz0MwMX+73mPfsWB5WcUWre3cv5uiSH64B
	BiARikvuiX0lZ15aqGUmCkewZZjBf7xknQVr9Cq9ERRm13W5NihvJmRiWBqgNsjcie9vLs
	ozx4OoBgPfjuEg98ZlMLkKhYYMfew/M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-gH05CQy0MrqxcWW0FCvmgg-1; Sun, 03 Sep 2023 08:07:02 -0400
X-MC-Unique: gH05CQy0MrqxcWW0FCvmgg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso35642066b.3
        for <llvm@lists.linux.dev>; Sun, 03 Sep 2023 05:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693742821; x=1694347621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww/X9A++x5CfrbV8/KeMYfQ017da0o9tfjIpanjcu1A=;
        b=InvrHUPujKtbzXPI7N1Zj0KmcCSQDpmXqVfWCcUouiVqMXhbxQ7X7P9XQcmF3UcEVh
         nVJbrapTrr9B2iVPVrY6TvjwNmwIUV1axpyQFfrmMyci7TWfZAJqoCVGwwVdl3jkdVTr
         7olh8+5UfQheyQCav2cmkXHAsBIemqTlS4Obql9hjUR71lwaw5twkR1Gu7M8VxBz0ZSW
         Hsad2Lvjlwco6vcvIAubfBh9p1VrvnLqKW2JOYcvzqR3vCyOMvMUQ6RW9pQ+kdDQE/T7
         jTG6FgNz5+ihM/N1fJc73gmfKNcEKP3IMv92AO5Yg262IJf+yH7fqyCHTIOmnZ62SUGy
         ZG5g==
X-Gm-Message-State: AOJu0YzMnwc2ZWEKZNgZw5YRbEqXliFbvdbm5eILi1Oc3kOU6cIczAtY
	Sm1jBetyS8FnfEisizmodPGBBpVVPNODbouYH9sv/V26mCdmekPKMhX15Kg327bPazOtJ8hC57D
	lqdxpJxAdqf3WeBWNNFHeCQ==
X-Received: by 2002:a17:907:2c77:b0:9a1:be50:ae61 with SMTP id ib23-20020a1709072c7700b009a1be50ae61mr4520751ejc.69.1693742820840;
        Sun, 03 Sep 2023 05:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZI9cDOCy5Of03hhWcDQWRttrAYSGtOIHFJh+LXh/+REb+CH5467mefoQoU9OhSTXlKuV8Rg==
X-Received: by 2002:a17:907:2c77:b0:9a1:be50:ae61 with SMTP id ib23-20020a1709072c7700b009a1be50ae61mr4520740ejc.69.1693742820494;
        Sun, 03 Sep 2023 05:07:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ov22-20020a170906fc1600b00992c92af6f4sm4781695ejb.144.2023.09.03.05.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 05:06:59 -0700 (PDT)
Message-ID: <da3fe9b0-9a64-e912-d8ec-b3e9acd1813e@redhat.com>
Date: Sun, 3 Sep 2023 14:06:58 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: ld.lld: error: undefined symbol: sysfs_format_mac
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 David Thompson <davthompson@nvidia.com>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Vadim Pasternak <vadimp@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Shravan Kumar Ramani <shravankr@nvidia.com>
References: <202309031058.JvwNDBKt-lkp@intel.com>
 <e566266a-f6f8-bad2-884d-22c394be52be@infradead.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e566266a-f6f8-bad2-884d-22c394be52be@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/23 06:32, Randy Dunlap wrote:
> 
> 
> On 9/2/23 19:39, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   92901222f83d988617aee37680cb29e1a743b5e4
>> commit: 7e38a7422f128e7d7ba24b444e957d585dbb272f mlxbf-bootctl: Support sysfs entries for MFG fields
>> date:   10 days ago
>> config: arm64-randconfig-r024-20230902 (https://download.01.org/0day-ci/archive/20230903/202309031058.JvwNDBKt-lkp@intel.com/config)
>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031058.JvwNDBKt-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202309031058.JvwNDBKt-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: sysfs_format_mac
>>    >>> referenced by xarray.c
> 
> I don't see what xarray.c has to do with this.
> 
> This happens when CONFIG_NET is not enabled.

Right, so this suggests that config MLXBF_BOOTCTL in
drivers/platform/mellanox/Kconfig needs a:

	depends on NET

David, Vadim, can one of you submit a patch for this?

Then I'll get that queued up as a 6.6 fix.

Regards,

Hans


p.s.

I wonder if it would not be better to just turn into
a static inline helper instead of an exported symbol.

It is really just a small wrapper around sysfs_emit():

ssize_t sysfs_format_mac(char *buf, const unsigned char *addr, int len)
{
        return sysfs_emit(buf, "%*phC\n", len, addr);
}
EXPORT_SYMBOL(sysfs_format_mac);

Making this a static inline thus should not grow the code
size, while removing a symbol from the exported symbol list.

Regards,

Hans




>>    >>>               vmlinux.o:(oob_mac_show)
>>
> 

