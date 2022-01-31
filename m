Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E7829CA
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 14:10:55 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c192so10296838wma.4
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6dCXZo48naQwOUhH8exvYmXyz16ZlvGpfz7M4SorczA=;
        b=LtP9aG592xZgjK6C2a9pl137xzJWzPaoR2KjvWe1Fv+2SmfXKrmeTYeLdiVGu630Sm
         5hRWBG/0PdVkKihEhIHjwM3lj2pkSd8G4eO59EKA+tHQ+e3PItENr3GriYU/+GxaV0RJ
         lVJQv2CyNdhJKpS/NmyziFwWtNdqmGLsQFrZCg9pj0K4I7jnm1pQG8val7yBOqXsmLRW
         PNMrmpRn7BVEYGiKwNRLpeMW8gDi1gF5d/AWVAyuxnQZd+mg/0n7b28Y4WBIuLNd9V0s
         NgB1/ps6yF38NM6736h3jqcVw50IlcTN/UJzpdyRUwNg33h57R3pg6mtKuGIG9j1rJKM
         faPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6dCXZo48naQwOUhH8exvYmXyz16ZlvGpfz7M4SorczA=;
        b=2q2gCNit2RvenIOdDOja8S052l9Ze3ev/943GmhmXy0dJNAGUPOKb3tPSqSCy0L8nL
         xfaYzcEsJ714o0Mi4mFxrJ0fh4U4nlDwvRuwnxrR2qoqDPFOYfv7pZfYBhdDN6SpYBuE
         IQ/MCTv/pkigiNCzKX3BpjhA+KGicyuQ9tjBx8ZIt1CwtBL3dX+MM7jmsxGsoiQsEFle
         SFxL84JUbz4oPxy8Egr4Ec8q6KB6FtdK+nNOVJytHCwQUeQOQuhr7STh7ci1ehav2Tq2
         tQEQns38alTi+blZqBYZ77WKSyG4JPvh6fgd3HoiYJnAMxVojmbV3rlPE8FZN5eDOpBN
         5ubQ==
X-Gm-Message-State: AOAM531Olk/7pxcbPgeeT0r3DIp22xCryQ7p4ESYa1wyJ83Q3YNnMMBc
	LqV1Kloi1lQNv+1OBho5G8V2IA==
X-Google-Smtp-Source: ABdhPJy3OERDNAZRYf8Yb6gVLnQDGrGaaDZmV+GvWsDoZBjzs9ZmBZhgiXD/APvrFWls1sP7u4k5EQ==
X-Received: by 2002:a05:600c:3552:: with SMTP id i18mr7684766wmq.21.1643638253428;
        Mon, 31 Jan 2022 06:10:53 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id 21sm9284582wmk.45.2022.01.31.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 06:10:53 -0800 (PST)
Date: Mon, 31 Jan 2022 14:10:30 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	shuah@kernel.org, ndesaulniers@google.com, kafai@fb.com,
	songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, quentin@isovalent.com, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] tools: Help cross-building with clang
Message-ID: <Yfft1sqfXGTAjwJ8@myrica>
References: <20211216163842.829836-1-jean-philippe@linaro.org>
 <20211216163842.829836-2-jean-philippe@linaro.org>
 <YfSUAPnZX/wP8U+p@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfSUAPnZX/wP8U+p@archlinux-ax161>

Hi Nathan,

On Fri, Jan 28, 2022 at 06:10:24PM -0700, Nathan Chancellor wrote:
> > diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> > index 071312f5eb92..b0be5f40a3f1 100644
> > --- a/tools/scripts/Makefile.include
> > +++ b/tools/scripts/Makefile.include
> > @@ -87,7 +87,18 @@ LLVM_STRIP	?= llvm-strip
> >  
> >  ifeq ($(CC_NO_CLANG), 1)
> >  EXTRA_WARNINGS += -Wstrict-aliasing=3
> > -endif
> > +
> > +else ifneq ($(CROSS_COMPILE),)
> > +CLANG_CROSS_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc))
> 
> Apologies for noticing this so late, I only ran into this recently.
> 
> This line causes a warning when running 'make clean' when
> '$(CROSS_COMPILE)gcc' does not exist in PATH. For example:
> 
> $ make -skj"$(nproc)" ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- LLVM=1 LLVM_IAS=0 clean
> which: no powerpc-linux-gnu-gcc in ($PATH)
> 
> I only have powerpc-linux-gnu binutils in my PATH, not GCC, as I am only
> working with clang.
> 
> This happens because of the 'resolve_btfids_clean target', which always
> runs when running the 'clean' target on an in-tree build (since
> $(objtree) = $(srctree)).
> 
> I tried looking into the best way to fix this but I am not at all
> familiar with the tools/ build system; would you mind taking a look?
> I see some machinery at the top of tools/bpf/Makefile for avoiding
> running some commands under certain commands but I am unsure how to
> shuffle that around to make everything work.

I think it's simpler than that, we should just suppress the errors from
'which'. It's fine that $(CROSS_COMPILE)gcc doesn't exist and
$(GCC_TOOLCHAIN_DIR) is empty, but 'which' should keep quiet about it.
I did test this patch with cross-build and no gcc, but Debian's 'which' is
quiet by default so I missed the error. I'll send a fix shortly.

Thanks,
Jean

