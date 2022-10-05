Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9AF136B;
	Wed,  5 Oct 2022 11:19:45 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u10so25351472wrq.2;
        Wed, 05 Oct 2022 04:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZOH0N862OH/9tiivSt3Zwjt1qR1oUocM3XEbjZOA5Xs=;
        b=p7hISEZxTLVrPFiIi0B0dRX9xAJv7UNvnE9chppraPoeFcDGnYgmBx7MsPASMikx7G
         wbA5/N24Zr1SDnUFS219VtWjVVzWI8ci9lLmJCa1uE+xWm7Ij8o23Uk+sVKMH0HOwhyq
         46wws/br7R6VdhUZST8gkDX94W8FD8Qaa0rk6paqpjPxiZB07oLDxHSMPMLAbs2cSUFX
         xnwBOniashRY//mCbHOF1K4jdWMy5nBtpIP34SevKDdZs6cw9HgxroWtTSZh7SIDZt3M
         GPgGr/fzo/bAdEeaVUXgAiCHCF7D2+4EP5K63Y/RDoC8YBfh3b5XZ5Nu2iDNFgICw3sr
         ny2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOH0N862OH/9tiivSt3Zwjt1qR1oUocM3XEbjZOA5Xs=;
        b=vF/OTVKA8xL8JQ+Uj9tEhBJWeG7a40v/OMotkM2CzoIuXB/2inDURN5hJ9Ikw4cqwc
         t640/ydGOiZTKK8gmzJyv8TOly50KL4jBfGOo/NfFt4FA7D5tR4mVeVN/cW1RchLWEZJ
         aeRrXFMdpI8jDQg0pnfwWJB+TMq849p24fJ5LplOZ65gv4DtZDpksPf2lI9lRUT0HqKc
         JnTN4ilQvTri41fy+1cw/Bk9Z2JxLJISLZBZK7R27TwO4m/xcR+FDTKQCIrkE77nRerZ
         Fjh6twyfKArPBa6idkKgCahaM95gIL5RhRNdY1Cc37ZswtL0gwjKXeckFd4iGf1FxvGg
         m9lg==
X-Gm-Message-State: ACrzQf0O4R0buqyJfMWRCRTF4RaIWZGpCVCKkuF0X/XR1A2komna2OL5
	wyykzopZHKUgeWcMIDub42U=
X-Google-Smtp-Source: AMsMyM7MATMXyZeCGO0qZBzgn4wRxM30AAQNmiEGIHECsD8SmyDHKW1kRFhFnMcsDjUGC6TUcmdX6w==
X-Received: by 2002:adf:fdcf:0:b0:22e:3ef3:1d28 with SMTP id i15-20020adffdcf000000b0022e3ef31d28mr8765657wrs.331.1664968784078;
        Wed, 05 Oct 2022 04:19:44 -0700 (PDT)
Received: from debian (host-78-150-37-98.as13285.net. [78.150.37.98])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c19d300b003bf6da9d2cesm1138180wmq.28.2022.10.05.04.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:19:43 -0700 (PDT)
Date: Wed, 5 Oct 2022 12:19:42 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-next@vger.kernel.org
Subject: build failure of next-20221005 due to a3a956c78efa ("fs/ntfs3: Add
 option "nocase"")
Message-ID: <Yz1oTvzDpCkOE+fr@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

The builds of x86_84 allmodconfig with clang have failed to build
next-20221005 with the error:

fs/ntfs3/namei.c:445:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (toupper(c1) != toupper(c2)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/ctype.h:64:20: note: expanded from macro 'toupper'
#define toupper(c) __toupper(c)
                   ^
fs/ntfs3/namei.c:487:12: note: uninitialized use occurs here
        __putname(uni1);
                  ^~~~
./include/linux/fs.h:2803:65: note: expanded from macro '__putname'
#define __putname(name)         kmem_cache_free(names_cachep, (void *)(name))
                                                                       ^~~~
fs/ntfs3/namei.c:445:3: note: remove the 'if' if its condition is always false
                if (toupper(c1) != toupper(c2)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/ntfs3/namei.c:434:7: error: variable 'uni1' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
                if (!lm--) {
                    ^~~~~
fs/ntfs3/namei.c:487:12: note: uninitialized use occurs here
        __putname(uni1);
                  ^~~~
./include/linux/fs.h:2803:65: note: expanded from macro '__putname'
#define __putname(name)         kmem_cache_free(names_cachep, (void *)(name))
                                                                       ^~~~
fs/ntfs3/namei.c:434:3: note: remove the 'if' if its condition is always false
                if (!lm--) {
                ^~~~~~~~~~~~
fs/ntfs3/namei.c:430:22: note: initialize the variable 'uni1' to silence this warning
        struct cpu_str *uni1, *uni2;
                            ^
                             = NULL
2 errors generated.

git bisect pointed to a3a956c78efa ("fs/ntfs3: Add option "nocase"").

I will be happy to test any patch or provide any extra log if needed.


-- 
Regards
Sudip
