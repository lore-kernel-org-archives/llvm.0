Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1C29A2
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 22:26:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id m3so32696758lfj.11
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 15:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eq/hDx8wKMs4js8aHxkHKYQ3P3T4FpD2LhDpEFtVod8=;
        b=nBYJRcr2epLmw7W5jj1DyWNoaJ5PytYBRiMKYL/5744Lo+5+ej7neYHnCHJ4YJqphU
         C5h9ci26W7DViGTe0ndNPnBM4oKxbdfYDOt6SjGf2bUcoaI0RPuAeN7Mbc2ciaNOn3LS
         +iot8PcYUJ5ZZrLmgcpvnZVXJLHooDPQZeC6omwt6phleOd+J+ALSDxuEWCI0UfCFX3N
         78NyjyceETkVbQnm5ptEVrkETKMr6mHVGL7GNHO8spoaU75R2kkGGdghwh3+ktCHpvgp
         1H4tIuOOJ/TQtyn5mnb/Awl39xf2FLcKSvHfstXXb4fS2MThWo3QzUquaKD8DgkxUpmU
         AK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eq/hDx8wKMs4js8aHxkHKYQ3P3T4FpD2LhDpEFtVod8=;
        b=3ovDCjljCWHJyLgdbyVXKPK6FPbJXW7gUiq8iBhVZN/7LiC5r0xoHNLpZ/qhDQm0a2
         18+NbuIac7t0qdmvb8EzOce1sR/gaYRQX4yhFu6VHZq7Vb3JmXbBWFtaFVU2mjsZvEdg
         2Mf8OfUKpJbzVaksscEmSbAMswDEFMgrnIxd0fyW9fZisvGzPfN0EVLaGU6MDStd4BYP
         gSM3iOIiXT7FlElYAWajxKms0/dL/kogZDycSy20mTBTSNwzxVEbzpBvKbbqPC5RSUyX
         v2Wmfs6FbDRZvnly8oWHKwepU3FGXrG+WDdaHkwuxeadQ4WMLqEQG347E2HxdpUzNWQU
         TC7w==
X-Gm-Message-State: AOAM533WjNjrshmNa3oqzILD3QGj+o376TPWMcYRu4pVU4bQy+2pt3aA
	QcKjyZqSW0aLquZpRb9yMY/n0hwfGkWHvfdjnhia4Q==
X-Google-Smtp-Source: ABdhPJz3fitcJ9qiEhta3zosFy6t5FScI80eSjKMeWv3ImRq4Hse8lAvC4NsmaCiNOkGV9qvbZvQvPgFok3UlpIpuZg=
X-Received: by 2002:a05:6512:108b:b0:44a:6dc2:ffeb with SMTP id
 j11-20020a056512108b00b0044a6dc2ffebmr4701180lfg.184.1648592781335; Tue, 29
 Mar 2022 15:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220329212946.2861648-1-ndesaulniers@google.com>
 <CAKwvOdmsnVsW46pTZYCNu-bx5c-aJ8ARMCOsYeMmQHpAw3PtPg@mail.gmail.com> <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Mar 2022 15:26:09 -0700
Message-ID: <CAKwvOdmYzH91bzNus+RcZGSgCQGY8UKt0-2JvtqQAh=w+CeiuQ@mail.gmail.com>
Subject: Re: [PATCH] net, uapi: remove inclusion of arpa/inet.h
To: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 29, 2022 at 3:09 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 29, 2022 at 2:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Mar 29, 2022 at 2:29 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Testing out CONFIG_UAPI_HEADER_TEST=y with a prebuilt Bionic sysroot
> > > from Android's SDK, I encountered an error:
> > >
> > >   HDRTEST usr/include/linux/fsi.h
> > > In file included from <built-in>:1:
> > > In file included from ./usr/include/linux/tipc_config.h:46:
> > > prebuilts/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/arpa/inet.h:39:1:
> > > error: unknown type name 'in_addr_t'
> > > in_addr_t inet_addr(const char* __s);
> > > ^
> >
> > Oh, this might not quite be the correct fix for this particular issue.
> >
> > Cherry picking this diff back into my Android kernel tree, I now observe:
> >   HDRTEST usr/include/linux/tipc_config.h
> > In file included from <built-in>:1:
> > ./usr/include/linux/tipc_config.h:268:4: error: implicit declaration
> > of function 'ntohs' [-Werror,-Wimplicit-function-declaration]
> >                 (ntohs(((struct tlv_desc *)tlv)->tlv_len) <= space);
> >                  ^
> >
> > Is there more than one byteorder.h? Oh, I see what I did; ntohs is defined in
> > linux/byteorder/generic.h
> > not
> > usr/include/asm/byteorder.h
> > Sorry, I saw `byteorder` and mixed up the path with the filename.
> >
> > So rather than just remove the latter, I should additionally be adding
> > the former. Though that then produces
> >
> > common/include/linux/byteorder/generic.h:146:9: error: implicit
> > declaration of function '__cpu_to_le16'
> > [-Werror,-Wimplicit-function-declaration]
> >         *var = cpu_to_le16(le16_to_cpu(*var) + val);
> >                ^
> >
> > Oh?
>
> Should there be a definition of ntohs (and friends) under
> include/uapi/linux/ somewhere, rather than have the kernel header
> include/uapi/linux/tipc_config.h depend on the libc header
> arpa/inet.h?
>
> It looks like we already have
> include/uapi/linux/byteorder/{big|little}_endian.h to define
> __be16_to_cpu and friends, just no definition of ntohs under
> include/uapi/linux/.
>
> Also, it looks like include/uapi/linux/ has definitions for
> __constant_ntohs in
> include/uapi/linux/byteorder/{big|little}_endian.h.  Should those 2
> headers also define ntohs (and friends) unprefixed, i.e. the versions
> that don't depend on constant expressions?

I think the answer is yes; in addition to the diff in this patch, the
following seems to be working:
```
diff --git a/include/uapi/linux/byteorder/little_endian.h
b/include/uapi/linux/byteorder/little_endian.h
index cd98982e7523..c14f2c3728e2 100644
--- a/include/uapi/linux/byteorder/little_endian.h
+++ b/include/uapi/linux/byteorder/little_endian.h
@@ -103,5 +103,8 @@ static __always_inline __u16 __be16_to_cpup(const __be16 *p)
 #define __cpu_to_be16s(x) __swab16s((x))
 #define __be16_to_cpus(x) __swab16s((x))

+#define htonl(x) __cpu_to_be32(x)
+#define htons(x) __cpu_to_be16(x)
+#define ntohs(x) __be16_to_cpu(x)

 #endif /* _UAPI_LINUX_BYTEORDER_LITTLE_ENDIAN_H */
```
I think if I flush out the rest for both endiannesses, then we should
be in good shape?

>
> (I wish there was an entry in MAINTAINERS for UAPI questions like this...)
>
> >
> > >
> > > This is because Bionic has a bug in its inclusion chain. I sent a patch
> > > to fix that, but looking closer at include/uapi/linux/tipc_config.h,
> > > there's a comment that it includes arpa/inet.h for ntohs; but ntohs is
> > > already defined in include/linux/byteorder/generic.h which is already
> > > included in include/uapi/linux/tipc_config.h. There are no __KERNEL__
> > > guards on include/linux/byteorder/generic.h's definition of ntohs. So
> > > besides fixing Bionic, it looks like we can additionally remove this
> > > unnecessary header inclusion.
> > >
> > > Link: https://android-review.googlesource.com/c/platform/bionic/+/2048127
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  include/uapi/linux/tipc_config.h | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/tipc_config.h b/include/uapi/linux/tipc_config.h
> > > index 4dfc05651c98..b38374d5f192 100644
> > > --- a/include/uapi/linux/tipc_config.h
> > > +++ b/include/uapi/linux/tipc_config.h
> > > @@ -43,10 +43,6 @@
> > >  #include <linux/tipc.h>
> > >  #include <asm/byteorder.h>
> > >
> > > -#ifndef __KERNEL__
> > > -#include <arpa/inet.h> /* for ntohs etc. */
> > > -#endif
> > > -
> > >  /*
> > >   * Configuration
> > >   *
> > >
> > > base-commit: 5efabdadcf4a5b9a37847ecc85ba71cf2eff0fcf
> > > prerequisite-patch-id: 0c2abf2af8051f4b37a70ef11b7d2fc2a3ec7181
> > > --
> > > 2.35.1.1021.g381101b075-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
