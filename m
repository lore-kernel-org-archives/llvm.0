Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6F10FC
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 09:08:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id z192so16621540yba.0
        for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 01:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kOWylR3pFDf7/iXRlM9MtBiVx3OCX5Q16RmYl/Duvpc=;
        b=m2uhLbeZ0IvOt+TJn8j6XJHO5vN1TSxjVNIzabIvnTdb6SyowH+kexPolXKdL2zU5g
         5UYfs+BV5XSWttveP/L/5B20wrefHf8yMpma5OVTOk5vNmKqZs5VNYGNOijmRWQAzVAL
         b9NHWH6iiUJZiStgkkuc9V6T8zmfM3DFOVbTnbado9gvOZoaXNcjY0m6PIawJyFm/Qqe
         iF2jyaqdzxu04pK8JUfpXA+ZhroZcEZlTmRI/7n+SORbm5oE3sNidqHjSjUvvf6EOR9M
         Lqw3gcc7qM3yrQFMOjkdQWDRR5NWqRRE8wpbG4YrODrVu9KpqIYTKIKgFSPMZaCN84RI
         mIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOWylR3pFDf7/iXRlM9MtBiVx3OCX5Q16RmYl/Duvpc=;
        b=wGRO0RZcjwGwMcaDYlkaeDAxtxXlLoXzZPlvkj0nER56vPFdOW74IyafjkZf74SaDG
         h+TT8oCiKDeFX0DCU131ClljHIqKz2CWEtGv83P+6WPeX2QLlydqq4DJeNZBMlD6Md34
         hney7BoDzjadV2SezLvmYDbm9wKCx4S0Qf9XgS/Zi6lmTCnzA1vjtByLPoErMNLWKXkq
         r7wrHzWjl+yQDQf0vECYv0eJHNei9ASADMBCWtWObuY6iGXKKOXyAHXCr0qRcCxKtgq9
         Zt9f2fHu3Zkw/+W0594NdfrZUFUEmxnGgCnKJuJuAWynDd+yCg1K0RxLSP84yaYW6v7O
         YBjw==
X-Gm-Message-State: ANoB5pmnD4CcEBmw+Rbz228k3XD5/38ofjEwBU3zcvOwY7V1QcN2eTrP
	hcCvABI5pd4cl/InJaZX+2HTi+NbzmQ4ZmicNqNLUA==
X-Google-Smtp-Source: AA0mqf6GSa8pMJKCbBfaOwHcNLUDn2z/mEKkuoq4i2UxurDiU9eW1iF2AMMY9G/K7R3Gu53wMUF4iPxqWznv/Gn9P5o=
X-Received: by 2002:a25:9d8f:0:b0:6d0:155f:aa9e with SMTP id
 v15-20020a259d8f000000b006d0155faa9emr2687662ybp.448.1669108119939; Tue, 22
 Nov 2022 01:08:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 22 Nov 2022 14:38:28 +0530
Message-ID: <CA+G9fYvCWwndXdsvuW7iJ25wgfN6_iMY-OC_z6ufSwiJkzFFMw@mail.gmail.com>
Subject: next-20221122: tinyconfig: ppc n s390: kernel/printk/printk.c:95:1:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int [-Werror,-Wimplicit-int]
To: open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, John Ogness <john.ogness@linutronix.de>, 
	Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Today's Linux next 20221122 tag clang-15 tinyconfig builds fails on
powerpc and s390 architectures.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM_IAS=0 ARCH=s390
CROSS_COMPILE=s390x-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang'

kernel/printk/printk.c:95:1: error: type specifier missing, defaults
to 'int'; ISO C99 and later do not support implicit int
[-Werror,-Wimplicit-int]
DEFINE_STATIC_SRCU(console_srcu);
^
int
kernel/printk/printk.c:95:20: error: a parameter list without types is
only allowed in a function definition
DEFINE_STATIC_SRCU(console_srcu);
                   ^
kernel/printk/printk.c:261:29: error: use of undeclared identifier
'console_srcu'
                     srcu_read_lock_held(&console_srcu));
                                          ^
kernel/printk/printk.c:288:33: error: use of undeclared identifier
'console_srcu'
        return srcu_read_lock_nmisafe(&console_srcu);
                                       ^
kernel/printk/printk.c:300:28: error: use of undeclared identifier
'console_srcu'
        srcu_read_unlock_nmisafe(&console_srcu, cookie);
                                  ^
kernel/printk/printk.c:3122:20: error: use of undeclared identifier
'console_srcu'
        synchronize_srcu(&console_srcu);
                          ^
kernel/printk/printk.c:3469:20: error: use of undeclared identifier
'console_srcu'
        synchronize_srcu(&console_srcu);
                          ^
kernel/printk/printk.c:3521:20: error: use of undeclared identifier
'console_srcu'
        synchronize_srcu(&console_srcu);
                          ^
8 errors generated.

log:
https://builds.tuxbuild.com/2HtTqOb2b83eGTzpS4bjLf59Agd/

Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221122/testrun/13121925/suite/build/test/clang-15-tinyconfig/history/

--
Linaro LKFT
https://lkft.linaro.org
