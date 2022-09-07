Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AB89A7
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 17:45:24 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id cr9so10996387qtb.13
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date;
        bh=5TF/7Ge8AarupLQS/YY50TBrTd0spxW1v76SnBwcGAo=;
        b=iRBDHJm0KCq8rGVHywkz8m+OQ5SjDjc8zcsG+O+2wUDPBHACKfsvyuwulMHUjpuOL+
         rp0sKd7QJDVdB56z16a2ypKlglgjcgaQJ6wVKJF0rmpjRMX2Da68NBCmppi50Eef+OD0
         gKgb9I1DDsyyOTl0+hsE0q/1N8pN1OKucN9q4PU2K8WaPN5aiejN2+PKvpDpEdfXlFSR
         uLxKG/dD2IbjT4hyR+lDA+tAF6r5f9rE/CDkkH+WeY5iIVVhMIKewq5MQdgxeAUXt4Le
         rd3wRvpOJOGklZvrPGEgB52BG32PCj5c0/ckmip2MpOoeFabL0ZzusMLP/EBXFSBBVpR
         CwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5TF/7Ge8AarupLQS/YY50TBrTd0spxW1v76SnBwcGAo=;
        b=s+nwmjEeNCoBvkYzSEahmP7j2Hwhw8HrPfGaiJIv7P9FyaZjq5aRw03pbZdNZ4IbdC
         EQ0lcG/Kn/wVyE9TRehokP7lYv8QUiTivPdeoE8SszVByCvqn+r746n9XW0hmxcqrJNT
         YRHS2u+8AcCRp/MD9zmcz/6B34o+tfFiRvL2tsHo++FAwVKMqUqTPSWmFDTGXypfQOYC
         JzlfIQc/49Kgeolyuvizv2HUGiE/f8Z7oNRbw7rOT3TTuW0emZ71DZLrDLDa1WwV75lP
         mefLKXx1iR6Os2fc60mwkONUPtlJxBF+RjGekIlQbaRGMrmjiIXyj/25KTgogYTtA0k0
         BzQw==
X-Gm-Message-State: ACgBeo3cQaZ5iC9Lil24kP3raV/jmaF3VCTRwad1+IznhmVHpKtaio6F
	bIs2j+MrMgDoGvnA439FqhY=
X-Google-Smtp-Source: AA6agR6WiqHok6tRliCvnpHXulSKvMevKo+ZGr9+s7qVaub9L4Oen+QHpj3u4cUDpYURHKDuTQs2pg==
X-Received: by 2002:ac8:594a:0:b0:344:9e0e:cdc1 with SMTP id 10-20020ac8594a000000b003449e0ecdc1mr4411158qtz.144.1662572723386;
        Wed, 07 Sep 2022 10:45:23 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id 73-20020a370b4c000000b006bb619a6a85sm14075841qkl.48.2022.09.07.10.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 10:45:22 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id 8DFC427C0054;
	Wed,  7 Sep 2022 13:45:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 07 Sep 2022 13:45:22 -0400
X-ME-Sender: <xms:stgYY3n5uO-BxZxO3jSOmW-0Y2vweT5QpkbrdOGD2oOSfVq64VGHzg>
    <xme:stgYY60KZ3OYLIWrKVCN5bs8-FFyetB_0AlC6KUYSE7m0Ek9akck5daFwcKAWiqxX
    6K5kzLoBiyGTPm5Wg>
X-ME-Received: <xmr:stgYY9pRU4vSM2YTk7D_eux6SftdT8vSQSl-sLf3Tg1BQmlMWhH7RaPYjsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:stgYY_kh3_N3Ad4NorsIKLTFeyQ4AteU7NOQ67MLPByzOQn49LHM4w>
    <xmx:stgYY13xVsoeBq_vu0DXKErcV5IKpht9NgV8MW11F9Y0d5nbi6Dxqw>
    <xmx:stgYY-vugOztKNY58mmD98DcRmfgM_PaTk4cNgWnQKuVfTIt7jAXqw>
    <xmx:stgYY_yy1Is6mgViGl2LK297ISntb9MZKXlHhhfa1R2GyGDkW2aPSA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 13:45:21 -0400 (EDT)
Date: Wed, 7 Sep 2022 10:44:03 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] objtool, kcsan: Add volatile read/write
 instrumentation to whitelist
Message-ID: <YxjYY6SJhp1PtZos@boqun-archlinux>
References: <20220907173903.2268161-1-elver@google.com>
 <20220907173903.2268161-2-elver@google.com>
 <YxjXwBXpejAP6zoy@boqun-archlinux>
 <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNN2cch+HDVUYLD27sF9E39RaFrCf++KN=ZZ7j0DH8VaDw@mail.gmail.com>

On Wed, Sep 07, 2022 at 07:43:32PM +0200, Marco Elver wrote:
> On Wed, 7 Sept 2022 at 19:42, Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Sep 07, 2022 at 07:39:03PM +0200, Marco Elver wrote:
> > > Adds KCSAN's volatile barrier instrumentation to objtool's uaccess
> >
> > Confused. Are things like "__tsan_volatile_read4" considered as
> > "barrier" for KCSAN?
> 
> No, it's what's emitted for READ_ONCE() and WRITE_ONCE().
> 

Thanks for clarification, then I guess better to remove the word
"barrier" in the commit log?

Regards,
Boqun

> Thanks,
> -- Marco
