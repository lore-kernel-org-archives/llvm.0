Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3F9D52A;
	Tue, 18 Jul 2023 15:04:31 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-262e3c597b9so4086885a91.0;
        Tue, 18 Jul 2023 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689692671; x=1692284671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFtHqw4rzql1zwLHQ+4/JBNMTXyJBC/VCSLGrbZp4+k=;
        b=Dejt6vqRTfx/BCoJRBQy69k+j2ckg19qwaC31Fsx8hjlFf5cWqyKFa18T3WtrJcAHH
         CGsvAV7JahpxJulnNblmmkAhbwNIIOOCy5Pk+YBN4SUJ1QOZAHsKoLeXWvY64AyNPUUi
         eXCNrvKIg4QLu7rA4agUrFf5PeEcjsheHAahTq/1LkkdVbv0PkiF/6tNkB3kpSjHVg2A
         UT1xuGv1CP5O7+FF1C+ce/VWiZq7YY9L5Ah4AkQuPbv4iRJw1GSFH2yZmjolFZTqUWlN
         z8LTGEcikzrZZgghXDChZ6ZlYbNaRCHAaq9pILoNZHUjYozB7SuY8UqRVVs/lwMlhUtl
         dy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689692671; x=1692284671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFtHqw4rzql1zwLHQ+4/JBNMTXyJBC/VCSLGrbZp4+k=;
        b=cAEPcCPhYms1XUKVzETmOPfH5gccEqojmtceW7eSUf5PeeKnXwJFgn9BfgIGsBTAuK
         4OD8j0PiYchLy9P9QKMyht7IX6qFDtzu+dULhuvBNhL2ZgYXM302CQscVODgI+xp1Z3X
         AfJpTevu7G9lWf4YWuuzwmMIm/oK3sxSWJjwWDHY6V2KiaSggB7+PzALtjCAHou+STYA
         J4nrLnQosIsNe9eiyGX8r0H7ihvirU/3s98SUPRDQsYNgxpeL6qv8PtmPXwg9oIV8Gsb
         KkRw45wXQX7QZsVOrQMhIL3gTu7mRJOpaPjnIs/kTKf5eOfgqM7JB/b5wNP1DPYtLsGa
         aP8g==
X-Gm-Message-State: ABy/qLY/czEhkqepWQsHfDiJPNrKHL3hZuaL9S3fuZgvKeOJqaao8Ov1
	NSi+v+czSUZ9T+oMUYADpLU=
X-Google-Smtp-Source: APBJJlFxwCLD5e5RJEYgwtnxGo0pX3S1jrZWs9a4dKz+MGm9W4nVJN0oq8+C8T0ccFGC2531DIod2Q==
X-Received: by 2002:a17:90a:1786:b0:262:ec7f:af82 with SMTP id q6-20020a17090a178600b00262ec7faf82mr13064757pja.22.1689692671300;
        Tue, 18 Jul 2023 08:04:31 -0700 (PDT)
Received: from [172.23.111.174] ([113.251.0.121])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b00263f446d432sm6521305pjt.43.2023.07.18.08.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 08:04:30 -0700 (PDT)
Message-ID: <433ced5a-7a04-e54c-8774-e2a1ae514ffc@gmail.com>
Date: Tue, 18 Jul 2023 23:04:26 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [srcres258-doc:next 1/1] mm/memory-failure.c:1891:6: error:
 redefinition of 'is_raw_hwpoison_page_in_hugepage'
To: Stephen Rothwell <sfr@rothwell.id.au>, kernel test robot <lkp@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
References: <202307181715.0dwDb1O9-lkp@intel.com>
 <20230718202633.7578c89e@pine.rothwell.emu.id.au>
Content-Language: en-US
From: Hu Haowen <src.res.211@gmail.com>
In-Reply-To: <20230718202633.7578c89e@pine.rothwell.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/18 18:26, Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 18 Jul 2023 17:42:05 +0800 kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://github.com/srcres258/linux-doc next
> 
> This is not the linux-next tree.  It is a tree that merges linux-next
> every now and then which is *not* how to work with linux-next and will
> create lots of merge conflicts which may, or may not, be resolved
> correctly.  Please do *not* report any problems with this tree to me.

Sorry for troubling you, Stephen. It might be a misunderstanding for the
kernel test robot as the address of my tree is mentioned within
MAINTAINERS and it is detected and put into CI automatically. In truth
the tree has nothing to do with Stephen's linux-next tree and it is used
by myself for kernel documentation translation stuffs.

Consequently my intention is identical with Stephen - to disable the CI
jobs and error reports as it might act as junk information for both
Stephen and myself.

Thanks,
Hu Haowen

> 
