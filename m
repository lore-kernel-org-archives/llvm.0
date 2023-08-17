Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E97CA20
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 06:09:03 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-26b139f4e42so3765881a91.1
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692252542; x=1692857342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMupaGt3lT1C6kccf/TFi4L2Zf/EmehC3TxUCzjtixY=;
        b=FFPr75vKB+KpdBAwp2C3sgFtlfEVnChZG2+NKIhPJx2xbiWQe0rm+3eqQSt1ZYcesi
         YDMGMDtYR0328TGSOOy9F6RBFp4sQTgKJ0o+zGtaB+LO1awcFO7S/v/xpuKr4YSTwbz4
         VmOhac0ElSZ3hkkkPRHVATGDKuXniBOBMc39U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692252542; x=1692857342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMupaGt3lT1C6kccf/TFi4L2Zf/EmehC3TxUCzjtixY=;
        b=d2bj564AmWm2mHSr2o+P/L1606TSgS/XmraaKZg1zfLYNk0Xx1UIjHb8+gBW9C8Yxi
         hkijaWwbbeXbHhDnH4vGpK6NeNh82xcuPyd8+i+iW5WQIBZaLPI0POQEXqsWY4CK3mR4
         CNdZpUUY/GP13lMhIJyDv+rhXgs9Bnq4/GH420mfL0aBSKO0CwFdasY7GBUrdhxnHPLo
         RWE5+GZif+nqD/p7FyhyNiiaolRgZi+k3J+3WLDYNgh1Gl3FGCvt13D28hm1UGjzqHVG
         /VnHIXvoJHcQxTPRGSoibU/1qLUPec25uYgh/jK6aFhnenZqVBELJMHbrNZ33jC25iLG
         SOeQ==
X-Gm-Message-State: AOJu0YyPw9bt6dQTtiY+DM1Nt6qYkeQ7O2ZRfwU7r3yWw9bjYtD0WSVs
	66TQ9q+gi1MYv1d6M7BzhBpFRQ==
X-Google-Smtp-Source: AGHT+IG3QbcrpDrZ9Ru2n1cwj5LDSCPZgsOvfI1WKSbQd51Qm63XNFI7JaPbVv68FFkX9s/qIOWYLA==
X-Received: by 2002:a17:90a:990e:b0:268:6670:46df with SMTP id b14-20020a17090a990e00b00268667046dfmr2987411pjp.27.1692252542365;
        Wed, 16 Aug 2023 23:09:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 27-20020a17090a031b00b0026d034f6badsm815035pje.38.2023.08.16.23.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 23:09:01 -0700 (PDT)
Date: Wed, 16 Aug 2023 23:09:00 -0700
From: Kees Cook <keescook@chromium.org>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Florian Westphal <fw@strlen.de>,
	linux-hardening@vger.kernel.org
Subject: Re: [netfilter-nf-next:testing 2/9]
 ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field
 'target' with variable sized type 'struct ebt_entry_target' not at the end
 of a struct or class is a GNU extension
Message-ID: <202308162257.F7876776C9@keescook>
References: <202308171249.g1ywxhII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308171249.g1ywxhII-lkp@intel.com>

On Thu, Aug 17, 2023 at 01:03:20PM +0800, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
> head:   015e2d9101d3713c7bee16dccad171df04a3bbd5
> commit: 61b9e6bd48a6317c0a44ee4f3fecdec9de5baa9e [2/9] netfilter: ebtables: replace zero-length array members
> config: i386-buildonly-randconfig-r004-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171249.g1ywxhII-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171249.g1ywxhII-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308171249.g1ywxhII-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from <built-in>:1:
> >> ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field 'target' with variable sized type 'struct ebt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>            struct ebt_entry_target target;
>                                    ^
>    1 warning generated.

Eww, it looks like "struct ebt_entry_target" is used _within_ another
struct:

struct ebt_standard_target {
        struct ebt_entry_target target;
        int verdict;
};

So "verdict" overlaps with the "data" FAM:

struct ebt_entry_target {
        union { 
                struct {
                        char name[EBT_EXTENSION_MAXNAMELEN];
                        __u8 revision;
                };
                struct xt_target *target;
        } u;
        /* size of data */
        unsigned int target_size;
        unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
};  

These have been fixed in the past in a variety of ways -- it all depends
on how userspace is using them. In looking at Debian Code Search:
https://codesearch.debian.net/search?q=struct+ebt_standard_target&literal=1

It is exclusively doing casts and looking at the "verdict" member. So
the easiest conversion might be this:

 struct ebt_standard_target {
-       struct ebt_entry_target target;
+       unsigned char hdr[sizeof(struct ebt_entry_target)];
        int verdict;
 };

Or this might work (not tested):

diff --git a/include/uapi/linux/netfilter_bridge/ebtables.h b/include/uapi/linux/netfilter_bridge/ebtables.h
index a494cf43a755..d6f10163b14a 100644
--- a/include/uapi/linux/netfilter_bridge/ebtables.h
+++ b/include/uapi/linux/netfilter_bridge/ebtables.h
@@ -146,23 +146,25 @@ struct ebt_entry_watcher {
 };
 
 struct ebt_entry_target {
-	union {
-		struct {
-			char name[EBT_EXTENSION_MAXNAMELEN];
-			__u8 revision;
-		};
-		struct xt_target *target;
-	} u;
-	/* size of data */
-	unsigned int target_size;
-	unsigned char data[0] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
+	struct ebt_entry_target_hdr {
+		union {
+			struct {
+				char name[EBT_EXTENSION_MAXNAMELEN];
+				__u8 revision;
+			};
+			struct xt_target *target;
+		} u;
+		/* size of data */
+		unsigned int target_size;
+	};
+	unsigned char data[] __attribute__ ((aligned (__alignof__(struct ebt_replace))));
 };
 
 #define EBT_STANDARD_TARGET "standard"
 struct ebt_standard_target {
-	struct ebt_entry_target target;
-	int verdict;
+	struct ebt_entry_target_hdr target;
+	int verdict __attribute__ ((aligned (__alignof__(struct ebt_replace))));
 };
 
 /* one entry */


-- 
Kees Cook
