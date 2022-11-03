Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB75256D
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 23:18:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id f27so9287889eje.1
        for <llvm@lists.linux.dev>; Thu, 03 Nov 2022 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nFukTkOw1gbW4oWy1dnnjZjTg02KMsHFw8GpjXtUYU=;
        b=geRfAiNqwqJECVjVtpvPh5ybjpsHLeWnh1QnALVgXWTQjFlb/Z0cQvQQ4/yQG4qQ8W
         NGbCmycbKo2k+riXNNdGIP4FXw2D2PKAZ68ecs2Gtq2Maj+ZMlrHLaV5DnH2sI8Tnqsh
         /Pd1th7/joC6KAYBLTaldAkqAMhJg1EitLf+TIKPllOfzF/Hsr1zAoKEAGihqSZOuFJg
         ZVNh6RIRYq3wmRyKf/HMfnBrtmLxiVan0NL/rHwzsowOMiWYsI7yUv4WGzI+9LkXKjRp
         vhCxhturzIsbZOtfnQ8RVpiSvbUz52uk5u/yxLAe0ch/8gBBBYOKOhLMKpqC3vtvFJP8
         asgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nFukTkOw1gbW4oWy1dnnjZjTg02KMsHFw8GpjXtUYU=;
        b=uMwHvMJzMg4N5X20xrBn5kyLHABnmz33NCDaFJXlTVbc9wx6PtSRJMDQEfVMmXiVX7
         99TMHoU/KgDi9OKGwcznVHpVUM2zVEfdF+r9R4ZanX5MwYWlC5TV/4h390yLDJLCTj20
         G6bFzPuAVgEREDh6mObuKIlGvC0N7zTdxwtOaH1SfunGqNvQ8JhcnJ5R+DNQ1GQNgBrh
         Zpf7PB6AjDQWP/AbDjlCbG31pj1MZDU8sAlqYP1z5atsHORDFYkRYU9QKZJ9a1XjCtSx
         bFqp56uvy3qcRtQ0YCxHp8jz6xnF+J/aPp8kLA5d2Y/fyR4tAz22RZ0JFK0RggZhM5Kh
         TyXw==
X-Gm-Message-State: ACrzQf3TxhBswLSNQK4Kyb03kUN8BBem2BkM+I2AIKNct1GtlofsfMKQ
	XXxqukCy4+cbuz3s4RBo19YCRbZ4a+1YeqfiihdxQg==
X-Google-Smtp-Source: AMsMyM6hsn6YVhgFd5QkS0dns+dZWnGy8H25gQirK3LwhxHjBI+5T14PQQIwPtGB4ESce7EVy5loikiB2S+qGFbmHic=
X-Received: by 2002:a17:906:3f89:b0:7ae:35c9:f098 with SMTP id
 b9-20020a1709063f8900b007ae35c9f098mr53045ejj.303.1667517506498; Thu, 03 Nov
 2022 16:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102163252.49175-1-nathan@kernel.org> <Y2LJmr8gE2I7gOP5@osiris>
 <202211021259.9169F5CBE@keescook>
In-Reply-To: <202211021259.9169F5CBE@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 3 Nov 2022 16:17:50 -0700
Message-ID: <CABCJKud+RJKeiPypej+s8bW506m7xCY97NLm7EkLzUp8fZiBPQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] s390/ctcm: Fix return type of ctc{mp,}m_tx()
To: Kees Cook <keescook@chromium.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexandra Winter <wintera@linux.ibm.com>, Wenjia Zhang <wenjia@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 1:01 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Nov 02, 2022 at 08:48:42PM +0100, Heiko Carstens wrote:
> > On Wed, Nov 02, 2022 at 09:32:50AM -0700, Nathan Chancellor wrote:
> > > should s390 select ARCH_SUPPORTS_CFI_CLANG in the future.
> >
> > Yes, s390 should select that :)
> >
> > But, is there any switch or option I need to set when compiling clang,
> > so it knows about the kcfi sanitizer?
> >
> > I get:
> > clang-16: error: unsupported option '-fsanitize=kcfi' for target 's390x-ibm-linux'
> >
> > > clang --version
> > clang version 16.0.0 (https://github.com/llvm/llvm-project.git e02110e2ab4dd71b276e887483f0e6e286d243ed)
>
> You'll need the "generic arch support": https://reviews.llvm.org/D135411
> which is _almost_ landed. Testing would be welcome, for sure!
>
> Sami, do you have any notes on what common things were needed to get
> arm64 and x86_64 booting under kCFI? My only oh-so-helpful notes are
> "keep CFI away from early boot code". :P

You don't need to keep CFI away from early boot code, but bringing
this up in qemu+gdb initially is probably the best way forward. We
also had plenty of type mismatches in syscall wrappers in the
currently supported architectures, so that's another thing to watch
out for once your kernel boots far enough to start init.

Sami
