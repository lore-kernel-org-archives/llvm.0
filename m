Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B20E7E
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 17:27:52 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id f18so4135165yba.1
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eYFLkOH15WUxyshQH7IyfCniP9I+f+so33/XnMw+zuU=;
        b=Ht9KvSVBxG2t1eWl33+mRn3fpTUQd2SJmcJ2olSWOEs2yr31QGKgICGbexxlEXYKf9
         xrsXWU/WMi9mKdH1NLCIKWn6pdXwYtmfjGfUG79XBt4jrM8XFbAGRsrfgxwYwyBgwKMT
         JvtruWKg7piR+jPyceAQSuOlE0OSGkrG7ija4eW1A1q9gAfUSsOrlfRCADuopAq/ldr8
         XfZ8m9KnKLVBnsUPi3RUOzm19YcDVN9Btp1/JXeZYnE/IUA009Mpj3TIUimQtxMxTVcw
         VDG8UUxHV/0irNK8+Gb5RXFM6xxbbbxLpmhHrfUy5oAUQwsffTOrgZBvSQWmGbCmOjGt
         ijxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eYFLkOH15WUxyshQH7IyfCniP9I+f+so33/XnMw+zuU=;
        b=X/wqYp/KBxXVmZ8UxAq6jecY8AJxfiHQXAGE/L95T2v7gznvmW6BFphybIC45p2OCQ
         fDq347r35d9uhKQeV7pn8RT6sgxlnILH7qqsU091b58B7yRUPQ5I4KCmCAeXU4cT2d+7
         DhTJiJ0dNYutn/q3kBG9Mpo4Y2rC7vg8zxnw/q2AWCLTW/vuhsKFQAzPswG+pPQQMN5m
         8sLXQjSLIhMo0PBJpxU5cfTDVN7C9jn54pxSOXgTzvTrfoKBFcHmK/GxuguLvS7nv9OC
         r1sQds4BxWcIMkKGx8x7QwxVvCxg2lINFSxK86jMc3xSFZ6B0AXIoi6meM7FCmU9hB4u
         arUQ==
X-Gm-Message-State: ACgBeo1tJmSNZjXT+pZzVPLWe7AaaSjLd3BuTVo7g+1ASxTljo+k/2Zb
	o/FIInGlefDCYdhkyg4CLqPeq5iihoDgX/uqh0M=
X-Google-Smtp-Source: AA6agR7BaiR1tyaAnZ8QaPBivn1kOY5TWWuRj2Ipb8C5/Arv+AW8S/xqTqs4C5Z4nqjXfVhv+Yh1c4bb7Le5HKoNyHg=
X-Received: by 2002:a25:22c5:0:b0:694:dfa2:9d0 with SMTP id
 i188-20020a2522c5000000b00694dfa209d0mr23146792ybi.107.1662139671203; Fri, 02
 Sep 2022 10:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209021113.imFYddaU-lkp@intel.com> <YxIvVmJcKzJrIRzD@dev-arch.thelio-3990X>
In-Reply-To: <YxIvVmJcKzJrIRzD@dev-arch.thelio-3990X>
From: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Date: Fri, 2 Sep 2022 20:27:29 +0300
Message-ID: <CANXV_XzJd+gGK7E9=+++aZcG7FjMAGMtmcNDnENmOP3Y121ytQ@mail.gmail.com>
Subject: Re: [linux-next:master 4627/4736] ld.lld: error: vmlinux.o:(.debug_info+0x2096020d):
 relocation R_AARCH64_ABS32 out of range: 4295813883 is not in
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	kbuild-all@lists.01.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

One of the issues this patch was supposed to address was to overcome
the behavior of the debug-split in new GCC/Clang compilers.

As was agreed with Nick
https://lore.kernel.org/all/CAKwvOdmq-6poADRajPi6CXuKsYYEPEe1tjXFuLEH6kHprerUdw@mail.gmail.com/
it was better to fix it up by simply assigning DEBUG_CFLAGS := -g at
the beginning of Makefile.debug without adding an additional
CONFIG_DEBUG_MACRO_DEFINITIONS Kconfig option.

Regards,
Dmitrii
