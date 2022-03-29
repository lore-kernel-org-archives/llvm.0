Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463D129A1
	for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 23:13:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id bu29so32978285lfb.0
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lix+Cn9dLRv5V2E2a0f9nB/0OmFi21urXU4sSbZfBWU=;
        b=sZlEFLJPvaRLE0Rk3RMPGJKferH2Yz3zSwUzew6rdkAv4L0stLWlB/V6CTH0gRoaQS
         ZDYhZkrHmU8oTwVMdLuZ4n+d8ONA6gyWwrTQwJC4SbiGDxMerlEbjplV5lyVgK/Fr7cZ
         LBDJU2HsuC0mCfuCgcSw2KhfondlIVL7gnysBbSNFBnQDWiyIFxmZBcqgBzkl1Tvws/J
         GjCb6qL8nUObrCmsxVVtdQPI4TQlyDZJ5fjXfwagWSAlO3OnXFdVSqYwZpx7iBW/1HgP
         Mh84r7udN27JJB+YWlgq6++1hEFlx3fH1hkIdJO2uGluNjaTp8Nia71nTH3ZhnUrc3Am
         9ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lix+Cn9dLRv5V2E2a0f9nB/0OmFi21urXU4sSbZfBWU=;
        b=bLtuOPGQyl4t/mbwVf7zE9VZPRHHTR8SY1bNTtpC1SyHkK2YaJu8nWa1Sw/gj4oMR3
         nfzGp9zEr+4fBr7gglc3+rTJyy8YiFaj2xEvU8TwbLVL8zRzF1qHLnYz/LtaAbxHkyl9
         4I5eHYTBgn+F3tCugNL5sDbsjqCI8y+0jv194Fe+kL8IbGiFEk3gVZk6D2ZfLj/8kBjl
         cUmzql62QQ7hPt+HO35mfLD1R5y6mxQC2EHvCunsd4cuIu6uoNsZG4TJWOa+mgi4WRRi
         LNw+yZsMcpGkck/+I0JjLBKjOm8/rGF/AYVbI/d9ah3YyZ672evlTrPAkJqqOW0H90YX
         xjKw==
X-Gm-Message-State: AOAM533/qDrsz16/eRHuAr/kRYkEvKvLICt3Z+6T60EJqyz23NY+P1XU
	6UIbJClnQahCV6JP21LT29jskiawUW3d+h9ALQ84aA==
X-Google-Smtp-Source: ABdhPJwOZ3jcZwojGyojTgZxiJdEWLTpoM34ZLQKkLJD2E5imcrvKmtcCfFFNQKvBg/DEaUepLQmvQJzoCy+tY7Axlg=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr4583964lfv.626.1648595587152; Tue, 29
 Mar 2022 16:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmYzH91bzNus+RcZGSgCQGY8UKt0-2JvtqQAh=w+CeiuQ@mail.gmail.com>
 <20220329223956.486608-1-ndesaulniers@google.com> <20220329160137.0708b1ef@kernel.org>
In-Reply-To: <20220329160137.0708b1ef@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Mar 2022 16:12:55 -0700
Message-ID: <CAKwvOdnNqHOvFSqzhS+0wrPfKVvrz2VymAkZatyFTBwRsQtQnw@mail.gmail.com>
Subject: Re: [PATCH v2] net, uapi: remove inclusion of arpa/inet.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	David Howells <dhowells@redhat.com>, Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 29, 2022 at 4:01 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 29 Mar 2022 15:39:56 -0700 Nick Desaulniers wrote:
> > Testing out CONFIG_UAPI_HEADER_TEST=y with a prebuilt Bionic sysroot
> > from Android's SDK, I encountered an error:
> >
> >   HDRTEST usr/include/linux/fsi.h
> > In file included from <built-in>:1:
> > In file included from ./usr/include/linux/tipc_config.h:46:
> > prebuilts/ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/arpa/inet.h:39:1:
> > error: unknown type name 'in_addr_t'
> > in_addr_t inet_addr(const char* __s);
> > ^
> >
> > This is because Bionic has a bug in its inclusion chain. I sent a patch
> > to fix that, but looking closer at include/uapi/linux/tipc_config.h,
> > there's a comment that it includes arpa/inet.h for ntohs;
> > but ntohs is not defined in any UAPI header. For now, reuse the
> > definitions from include/linux/byteorder/generic.h, since the various
> > conversion functions do exist in UAPI headers:
> > include/uapi/linux/byteorder/big_endian.h
> > include/uapi/linux/byteorder/little_endian.h
> >
> > Link: https://android-review.googlesource.com/c/platform/bionic/+/2048127
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  include/uapi/linux/tipc_config.h | 32 ++++++++++++++++----------------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/uapi/linux/tipc_config.h b/include/uapi/linux/tipc_config.h
> > index 4dfc05651c98..2c494b7ae008 100644
> > --- a/include/uapi/linux/tipc_config.h
> > +++ b/include/uapi/linux/tipc_config.h
> > @@ -43,10 +43,6 @@
> >  #include <linux/tipc.h>
> >  #include <asm/byteorder.h>
> >
> > -#ifndef __KERNEL__
> > -#include <arpa/inet.h> /* for ntohs etc. */
> > -#endif
>
> Hm, how do we know no user space depends on this include?

Without the ability to scan all source code in existence, I guess I
can't prove or disprove that either way.

If this is a reference to "thou shall not break userspace," I don't
think that was in reference to UAPI headers, libc's, or inclusion
chains.

Worst case, someone might have to #include <arpa/inet.h> if they were
relying on transitive dependencies from <linux/tipc_config.h>.  I
don't think we should be helping people write bad code with such
transitive dependencies though.

>
> If nobody screams at us we can try, but then it needs to go into -next,
> and net-next is closed ATM, you'll need to repost once the merge window
> is over.

Ack.

>
> >  /*
> >   * Configuration
> >   *
> > @@ -257,6 +253,10 @@ struct tlv_desc {
> >  #define TLV_SPACE(datalen) (TLV_ALIGN(TLV_LENGTH(datalen)))
> >  #define TLV_DATA(tlv) ((void *)((char *)(tlv) + TLV_LENGTH(0)))
> >
> > +#define __htonl(x) __cpu_to_be32(x)
> > +#define __htons(x) __cpu_to_be16(x)
> > +#define __ntohs(x) __be16_to_cpu(x)
> > +
> >  static inline int TLV_OK(const void *tlv, __u16 space)
> >  {
> >       /*
> > @@ -269,33 +269,33 @@ static inline int TLV_OK(const void *tlv, __u16 space)
> >        */
> >
> >       return (space >= TLV_SPACE(0)) &&
> > -             (ntohs(((struct tlv_desc *)tlv)->tlv_len) <= space);
> > +             (__ntohs(((struct tlv_desc *)tlv)->tlv_len) <= space);
>
> Also why add the defines / macros?
> We could switch to __cpu_to_be16() etc. directly, it seems.

Sure, I thought they might be more readable, but whatever you all
prefer.  Will send a v3 once the merge window closes.
-- 
Thanks,
~Nick Desaulniers
