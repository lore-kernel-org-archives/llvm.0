Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF062FAE
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632825068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmdbTi66suJMLWatzWuhWowSC1T11IvXHNAMlcFutSw=;
	b=BHQ15uVDBGoVdzsXScg2l3zjFtwyHJebUytpX0oGHxTUKek1bebL/iQDW3odMPeehgBFHj
	C/FYbpSYOmoiiyPQstZjidmtkMh4bh6wkvn9qYoORCk5uWkP6mUNqdPTwp47kcDR/ohN9+
	Z1rmOc8Pm2aUmCdGAgMO3OZpsv1VmlA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-UNC2wY79OxWzTuzWhz2Usw-1; Tue, 28 Sep 2021 06:31:06 -0400
X-MC-Unique: UNC2wY79OxWzTuzWhz2Usw-1
Received: by mail-ed1-f71.google.com with SMTP id ec14-20020a0564020d4e00b003cf5630c190so21396387edb.3
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 03:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VmdbTi66suJMLWatzWuhWowSC1T11IvXHNAMlcFutSw=;
        b=Gt0iJBx3Tp384AUIHmOaXorBCBbmvU+j8pZp5/nOxQtV5n6pww32Bmf3azWTERE38x
         mIxow4zonss6QIMHka/mL+e628oP6DecLY2H4PmqtIHB7wGfdlmY6uFU+QgJXuAKtstt
         8IElGTHHOI2rWkMO0fO5iw0kcB9UaFqY9K9jcOszbq0RMpK0kEsan3oxrLI7Xo+8853e
         lAMTwhZcoJnVVC3Ctf7DO3nasQt9b618BZ/amyNC731vfmkn3fSMoa6OBAxyUD4u3vRc
         8s/c9A2jKvLjK2pnjsKymu+byi2wXN8059BE0QdAo8Fj5gl4u4Tjr0jOiH/Z29kB1hqr
         J2gA==
X-Gm-Message-State: AOAM5325zCO4GuK+opYF5VhT1wKf2+0zwmBEmitIqKzMitPOvi95egDT
	hjBaWpU6aeAdeI8NydfblT/WqXeiVE9+vtm/+ymUaaN1Iw+GOnJEmM8f8l6crxilegIJRSGNlCv
	RyeKIB+2cE5qQRMM94k4Ewj0uluVmqv9YYsamGeuItUKfTrz8viSq9lVwH0Msn9oaTA==
X-Received: by 2002:a17:906:1d41:: with SMTP id o1mr5788848ejh.232.1632825064903;
        Tue, 28 Sep 2021 03:31:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFbG/uqUP3opMXejTEgElNd9fqDUiWpFMm1vibd9SHt3bxBXAIljzCQp6BZdb8AYE7rc/C0A==
X-Received: by 2002:a17:906:1d41:: with SMTP id o1mr5788808ejh.232.1632825064627;
        Tue, 28 Sep 2021 03:31:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a23sm5346073edx.69.2021.09.28.03.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 03:31:04 -0700 (PDT)
Subject: Re: [PATCH] vboxsf: fix old signature detection
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
References: <20210927094123.576521-1-arnd@kernel.org>
 <40217483-1b8d-28ec-bbfc-8f979773b166@redhat.com>
 <20210927130253.GH2083@kadam>
 <CAK8P3a3YFh4QTC6dk6onsaKcqCM3Nmb2JhMXK5QdZpHtffjyLg@mail.gmail.com>
 <CAHk-=wheEHQxdSJgTkt7y4yFjzhWxMxE-p7dKLtQSBs4ceHLmw@mail.gmail.com>
 <70a77e44-c43a-f5ce-58d5-297ca2cfe5d9@redhat.com>
 <CAK8P3a3sEy7NAhMHcV7XPpZxo5tHnQz1oCP43YTe_ZQuzOHgPA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <42797736-a64b-e244-136a-d4526b732a50@redhat.com>
Date: Tue, 28 Sep 2021 12:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3sEy7NAhMHcV7XPpZxo5tHnQz1oCP43YTe_ZQuzOHgPA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 9/28/21 12:11 PM, Arnd Bergmann wrote:
> On Tue, Sep 28, 2021 at 11:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 9/27/21 8:33 PM, Linus Torvalds wrote:
>>> On Mon, Sep 27, 2021 at 6:22 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>>>
>>>> More specifically, ' think '\377' may be either -1 or 255 depending on
>>>> the architecture.
>>>> On most architectures, 'char' is implicitly signed, but on some others
>>>> it is not.
>>>
>>> Yeah. That code is just broken.
>>>
>>> And Arnd, your patch may be "conceptually minimal", in that it keeps
>>> thed broken code and makes it work. But it just dials up the oddity to
>>> 11.
> 
> Thank you for addressing it. I usually try to avoid overthinking changes
> to "unusual" code like this, but your solution is clearly an improvement.
> 
> What really threw me off this time is that my first attempt to address
> the warning was an exact revert of 9d682ea6bcc7 ("vboxsf: Fix the
> check for the old binary mount-arguments struct"), which in turn
> came from a tool that is usually correct and and that both Dan
> and Al thought the original patch was correct when it looked like
> it turned a working (though unusual) implementation  into a broken
> one.
> 
>> I agree that your suggestion is to be the best solution,
>> so how do we move forward with this, do I turn this into a
>> proper patch with you as the author and Arnd as Reported-by and
>> if yes may I add your Signed-off-by to the patch ?
> 
> It's already upstream, see d5f6545934c4 ("qnx4: work around gcc
> false positive warning bug").

Ah, actually you mean: 9b3b353ef330 ("vboxfs: fix broken legacy mount
signature checking"), but other then that yes you're right it
is already upstream.

Thank you Arnd and thank you Linus.

Regards,

Hans

