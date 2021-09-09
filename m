Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222073FE2
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 22:50:38 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id b84-20020a253457000000b0059e6b730d45so4427521yba.6
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 15:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cOv81gwC9dNLZhqvyYQGhAuBKrBFj15moK9/frQLFMU=;
        b=GDxCPvAruNETvNqoBKUPqU9jy05fk1bp3PWMM3Ljuxl6vVxIF4AQAnIMwpKJNL0LlE
         edukWYZi/ADH6MMDY1rpxPA0nFuzcN0O/HhhCXj5JeU2H8usrlcbcEFiAAfPU/0G4lfE
         BqdZklQWBrxjTrfzfMgUdg0CoJ47EV2STC35HOBP3LIHVQaWtPaLBBKDGmHDa8hR/5QO
         gOl3G+o+CYR9ywt8QyMzByFXdPCGHdpf98uU3VYW+XYTS2L4GkQSRVa3V8Li/NYa3xWq
         ZvC7SBNBEbzrHUqY4YkInYgBnpGF2UpsarBT8r1XeZOU/GZOK7fmEP/cUJt6qsJwBaFW
         s2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cOv81gwC9dNLZhqvyYQGhAuBKrBFj15moK9/frQLFMU=;
        b=YIueS2X+zGV3QN8aLb65YHV45eRDSxpl9tX8scYFDOAh+pfNivn4+PoKeWJbxRW13w
         mKcPyp7GUTrnKP5LPuNehHXkvBhuBsrvn1lEzFy81NIGmPKVcmlbFVTiBSsRWHGJw5ZK
         38KERK4XOBo+e0/YqcT3ZEM50cUQXGsFPgfkGWKDpvgpB4iCxpve7M3bVWPAz/bccoRs
         rwN3tb0+niSOKJKKcRJG+mTHWbuneDGBG5zZuNY3znvJXJkcW38zoqMj2pw/k/qo4M6L
         uKGtFHbYZEISK3aSSP8xqKj/Dl0mt8OLpoW2c510gJlfA+hLJq7oksyBxU9oMRKEX+zD
         IejQ==
X-Gm-Message-State: AOAM532O7P/jHlqwd5Y0AehFSePu+9E4WvUdUsOhboN/pzKlGKj4eciS
	gtj/s1I1v0ANYXVqaiwk0/H/xN5OZvRQYtcqKvs=
X-Google-Smtp-Source: ABdhPJwLFHXNgRlAL2YzqDpSi9C+NWVrDLnaDnOcMPOieXeSDgUkK6PEfuqwIliiam/Ydm/pGfidEk5vldeGCbWGJz0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:9a5f:693a:26cc:1fd6])
 (user=ndesaulniers job=sendgmr) by 2002:a25:664c:: with SMTP id
 z12mr7299807ybm.62.1631227837092; Thu, 09 Sep 2021 15:50:37 -0700 (PDT)
Date: Thu,  9 Sep 2021 15:50:35 -0700
In-Reply-To: <20210909182525.372ee687@canb.auug.org.au>
Message-Id: <20210909225035.3990728-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210909182525.372ee687@canb.auug.org.au>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: Re: linux-next: build failure while building Linus' tree
From: Nick Desaulniers <ndesaulniers@google.com>
To: sfr@canb.auug.org.au
Cc: axboe@kernel.dk, josef@toxicpanda.com, libaokun1@huawei.com, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Rasmus

This was introduced in
commit f0907827a8a91 ("compiler.h: enable builtin overflow checkers and add
fallback code")
which added division using the `/` operator, which is problematic when checking
for overflows of 64b operands on 32b targets.

We'll probably need helpers from linux/math64.h and some combination of
__builtin_choose_expr/__builtin_types_compatible_p.

That will help us fix another compiler bug for older clang releases, too.
https://github.com/ClangBuiltLinux/linux/issues/1438.
