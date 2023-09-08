Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0554C7B
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 11:47:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52e64bc7c10so2674975a12.1
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694173666; x=1694778466; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VHhi8IMrZarrM/u22h55GFBcFXVfkPwvuG0llyyHBQ=;
        b=XbKvBI7hq1faIk9DGB4qz7Xgbqre4NAuu3WyLjFM1APPVF4O2WiFS+Ocd3pU/aweAW
         voczo0yDypiciyVCbYoXAwbFbitZSAxQzUOwG4lOwwceyE2DJW5sNdcQWf+EmRGtXx0+
         io0w8w7gZrsXc0ZdACdUqMf4YZvxAV70spyLIs6ciBzqlcSyKTHv4kJgmquqk8sSi71g
         5gcYxfkTL1JT4XEHQnfJHh/zYcGdEPSGIUc8mzfqM7RyQAkIfxQa10BkaCE4H10tZXzM
         A+72h8xdRWCAqpcxscmNnY2hpkDHmt5A7ZXB2hGIelpsNxErrfUlka7bezPerNNQr1jC
         EWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694173666; x=1694778466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VHhi8IMrZarrM/u22h55GFBcFXVfkPwvuG0llyyHBQ=;
        b=i9xkB/q13XQUUiMZdRbPWt1UQFX8Q0al691mAlwPSEyABQb1Vv/LkB5n5N8vHuuwlP
         3iDfHmqHBf68a77dWdMwgCA5bopq+WfaNdTaa/6j1e5AKmGUA+FKG3xb9iWBMpWHtnRp
         O1SLzVmyaPGhmsU1/cDzKjvVvZr0h1yNoBTL9kEYGEtV2/n+LCbVlM92ScfUnUWhZBCq
         ExV72bEBS9IXNjvDQa2tondbiGfzn/yTKyyKmyhxnxpizBgvCFF+cXT+B+We/tIqEUuP
         5M6zXeLIkx54pD/ojn3nfJAVhFjAw1pXZzPf0QdugYSy+l3XHzPL/TdpG4a1V7ipCXIr
         5RcQ==
X-Gm-Message-State: AOJu0YwaEuAQZyCADXf+UFCUGGEOUplGnNalmO4XqHm5FsIOYamtrY2g
	NrfGUksjx1h187V0fdzIWy4=
X-Google-Smtp-Source: AGHT+IGMuQPSdSbVf9Ce26vo+FRU8shtKu/MxTncqfS+a86gEMBFPBGWTNddjF81trqAu9UNvDJAzw==
X-Received: by 2002:a50:ed06:0:b0:51a:3159:53c7 with SMTP id j6-20020a50ed06000000b0051a315953c7mr1796725eds.30.1694173666578;
        Fri, 08 Sep 2023 04:47:46 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id t11-20020aa7d70b000000b0052e901cef48sm936374edq.48.2023.09.08.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 04:47:46 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 8 Sep 2023 13:47:44 +0200
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, bpf <bpf@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Stanislav Fomichev <sdf@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>, Song Liu <song@kernel.org>
Subject: Re: duplicate BTF_IDs leading to symbol redefinition errors?
Message-ID: <ZPsJ4AAqNMchvms/@krava>
References: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
 <ZPozfCEF9SV2ADQ5@krava>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPozfCEF9SV2ADQ5@krava>

On Thu, Sep 07, 2023 at 10:33:00PM +0200, Jiri Olsa wrote:
> On Thu, Sep 07, 2023 at 12:01:18PM -0700, Nick Desaulniers wrote:
> > So we've got a curious report recently:
> > https://github.com/ClangBuiltLinux/linux/issues/1913
> > 
> > ld.lld: error: ld-temp.o <inline asm>:14577:1: symbol
> > '__BTF_ID__struct__cgroup__624' is already defined
> > __BTF_ID__struct__cgroup__624:
> > ^
> > 
> > It's been hard to pin down a SHA and .config to reproduce this, but
> > looking at the definition of BTF_ID's usage of __ID's usage of
> > __COUNTER__, and the two statements:
> > 
> > kernel/bpf/helpers.c:2460:BTF_ID(struct, cgroup)
> > kernel/bpf/verifier.c:5075:BTF_ID(struct, cgroup)
> > 
> > Is it possible that __COUNTER__ could evaluate to the same value
> > across 2 different translation units, leading to a name collision like
> > the above?
> 
> hum, that probably the case, I see same counter values at different
> __BTF_ID_ symbols:
> 
> ffffffff833fe540 r __BTF_ID__struct__bpf_bloom_filter__380
> ffffffff833fe548 r __BTF_ID__struct__bpf_queue_stack__380
> ffffffff833fe578 r __BTF_ID__struct__cgroup__380
> 
> perhaps we were just lucky not to hit that :-\
> 
> > 
> > looking at another usage of BTF_ID other than struct
> > cgroup;kernel/bpf/helpers.c:2461:BTF_ID(func, bpf_cgroup_release)
> > is only defined in one translation unit
> > 
> > Should one of those two `BTF_ID(struct, cgroup)` be removed? Is there
> > some other way we can avoid these collisions in the future?
> 
> need to find some way to make the symbol unique, will check

the change below uses object's path as the __BTF_ID_.. symbol suffix to make
it unique

I'm still looking, but can't think of a better way so far, perhaps somebody
will have better idea

jirka


---
diff --git a/include/linux/btf_ids.h b/include/linux/btf_ids.h
index a3462a9b8e18..564953f9cbc7 100644
--- a/include/linux/btf_ids.h
+++ b/include/linux/btf_ids.h
@@ -49,7 +49,7 @@ word							\
 	____BTF_ID(symbol, word)
 
 #define __ID(prefix) \
-	__PASTE(prefix, __COUNTER__)
+	__PASTE(__PASTE(prefix, __COUNTER__), BTF_ID_BASE)
 
 /*
  * The BTF_ID defines unique symbol for each ID pointing
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 68d0134bdbf9..2ef8b2798be0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -200,6 +200,10 @@ _c_flags += $(if $(patsubst n%,, \
 	-D__KCSAN_INSTRUMENT_BARRIERS__)
 endif
 
+ifeq ($(CONFIG_DEBUG_INFO_BTF),y)
+_c_flags += -DBTF_ID_BASE=$(subst =,,$(shell echo -n $(modfile) | base32 -w0))
+endif
+
 # $(srctree)/$(src) for including checkin headers from generated source files
 # $(objtree)/$(obj) for including generated headers from checkin source files
 ifeq ($(KBUILD_EXTMOD),)
