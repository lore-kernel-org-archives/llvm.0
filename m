Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A37E
	for <llvm@lists.linux.dev>; Sun,  8 May 2022 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652012282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ViPu7C63pGsgCXqS/hC6gxwkjSv/UDhqQYN0XBn3F4U=;
	b=QsttS4TnH0QrNp9lBToEUyvEcnu5DKlFULvNpdJl/S2Q2Em5/5D+E0scgaFfqakb6TCs2h
	+5gW/dE3UDYKn1kLXAQebq2efMK8Dvdeqify3yQlnvxKMRv9s691qr/E1yqBncgPlfXVYc
	wN8nwzqC2fpXGvA2k+896mv+Ya7MbSg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-WVpvNFpBNju4U5oZ9qwv1A-1; Sun, 08 May 2022 08:18:01 -0400
X-MC-Unique: WVpvNFpBNju4U5oZ9qwv1A-1
Received: by mail-qt1-f200.google.com with SMTP id br6-20020a05622a1e0600b002f3d470aa4dso1656447qtb.21
        for <llvm@lists.linux.dev>; Sun, 08 May 2022 05:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ViPu7C63pGsgCXqS/hC6gxwkjSv/UDhqQYN0XBn3F4U=;
        b=bD3sa+l+ATIlVwuFqJgdmrbXlbmYlwnDtnomj+5A87dp64yhw0z1PP1avrz4Wji32R
         2NobMzqerrZytIk3bEsot3YOA9hWiYHyeg21l0AQXU6PKLz2MH0fQVEYk5lUt8/XR5Nr
         1PDZGgZ0NLcroaD9Rrc/uIjtrkjTHfqVPYGt3sgoILZ3P0fAYazPMrfaUJXU7GujUzcA
         1AD2D6h7+UmzqDCOOooy45rmkqp03Gh8TIZ4dq1TmjqHkBQ5ZyCXAFf3BmKRQSrgzBcR
         SuirRI2UX/PtriJ7XiY49m6B866iAcPrp74mzcwUWdo9WtTgDRLLdEevxkEF5xL377T8
         3AUg==
X-Gm-Message-State: AOAM53058NKPRERDZqKMWE3qnYSYatjIii5vGUqnuqEckkjiSHzEQTXd
	f1oBeE++Hky7Gx7N++4kDSrlj1uzLKN/Avgh0qjWg7AOE+atL3GTJdX68h9wEXvtsLazNySDhVO
	84uRNuoFN6Z1eVA==
X-Received: by 2002:a05:620a:4403:b0:6a0:5093:1742 with SMTP id v3-20020a05620a440300b006a050931742mr6090355qkp.691.1652012280974;
        Sun, 08 May 2022 05:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrSXVGMAErTCjyQ6DWWAm4LmtZ/sYouQE9alkl/0ZG+uocKKlzjN9i5/phkR2fAZmCw3HoQg==
X-Received: by 2002:a05:620a:4403:b0:6a0:5093:1742 with SMTP id v3-20020a05620a440300b006a050931742mr6090344qkp.691.1652012280768;
        Sun, 08 May 2022 05:18:00 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h8-20020ac87148000000b002f39b99f68csm5981079qtp.38.2022.05.08.05.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 May 2022 05:18:00 -0700 (PDT)
Subject: Re: uninitialized variables bugs
To: Nathan Chancellor <nathan@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: ksummit-discuss@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 kbuild@lists.01.org, lkp@intel.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20220506091338.GE4031@kadam>
 <YnWYHzQC4Y55sOsT@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <53237fa6-3d32-4f92-c7ea-9dd8bc12e028@redhat.com>
Date: Sun, 8 May 2022 05:17:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YnWYHzQC4Y55sOsT@dev-arch.thelio-3990X>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/6/22 2:50 PM, Nathan Chancellor wrote:
> Hi Dan,
>
> On Fri, May 06, 2022 at 12:13:38PM +0300, Dan Carpenter wrote:
>> Ever since commit 78a5255ffb6a ("Stop the ad-hoc games with
>> -Wno-maybe-initialized"), GCC's uninitialized variable warnings have
>> been disabled by default.  Now, you have to turn on W=1 or W=2 to see
>> the warnings which nobody except Arnd does.
...
> Clang's static analyzer, which Tom regularly runs, will check variables
> across function boundaries. I am not sure what the false positive rate
> on that check is but it does turn up issues like smatch does.

Clang's static analyzer is pretty go wrt uninitialized variables.

But the issues do not turn up in the report, the show up as errors and 
is why

I post a fix for a build break every couple of weeks.

Tom


