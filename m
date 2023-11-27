Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9D3FDF
	for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXAeOx4u"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-462ac0f82e3so1304690137.0
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701080673; x=1701685473; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cdp8QAZn1D8I/rEQSBUvbPEDzykyHAXvOt5qwyXf2M0=;
        b=cXAeOx4uzRcJ69nK3W1soMSEIQmeC0UkYExfuTV4FuqmNdKM1s3uu6efMbmOWp38kN
         0wm3cOacJsOOJkr/Gi7dq63V+fjfk+7oxh3eY/iC7mDxYcfZ6kIPeCJuWKOvRrYSs50s
         40VXpCeLld5NojbrVEjvaF/nDB5Jc6tfHRGi8YwGLs9z8pEvyl9wrJQp0u1dmeeI35v2
         +XXa5ygxBGHFzWJZhdrcwhM9EYAiPtEr90jBoKAi1vgCietSS+j59YcRkuf4Y5mz3DBW
         Ovi+qAvZQQAXuMZH5lsgrazeDF7Mu4vJDl9QTbvB6i63Ou7SqJ5PqtcaXZ8h526uvmCg
         daFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080673; x=1701685473;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdp8QAZn1D8I/rEQSBUvbPEDzykyHAXvOt5qwyXf2M0=;
        b=q/CRRDCjwDxzM4BzAe5r5XALAbXVezUuSujsnVUWSgDCOxXZsq8yUiMy1ImIU8iBwC
         epkVlDFtXhuz+87D3CLFGAjt+Zq/LFFS630dwyRVqju/pfMBJJdnJdRZwhtwXHvW/LWv
         ZOv9Q0LD7cZgENVSVfB6+AM/r71aSmH96wc3//0cBB7iQVb5fjQzH1/zTx2NGQEKMSg2
         ce2gJH/7hHc9XnlmDmXHeqIPTORJ562ZYsHhOwJIt3dL2rIwjkH3rND1faqUJAShkbbx
         EJ9p4AwaLKpNik7i3UgV5tH9uXz9VwbrLwPqDLol0YpdP892OyJ1f1QJx84ibOey1Ivi
         +SzQ==
X-Gm-Message-State: AOJu0YxvLxFUuAG1kMs+XKkqL6RtXQtsT/Bjplz8o1BVrZkDfn4j17sD
	QJzrFcCiisMZxfMnoyFwl4UWjBZuSxoEq+Wkf96CBQ==
X-Google-Smtp-Source: AGHT+IGVgRALVFNM2U4HPGezSL7BWKq/nblzK1PIlq8pxjAGxKwRm1tQiB7qPihapLMbC+3QEHZXW4jBJTAFWIsKKEI=
X-Received: by 2002:a05:6102:3e95:b0:45f:4e67:4423 with SMTP id
 m21-20020a0561023e9500b0045f4e674423mr15393245vsv.0.1701080673247; Mon, 27
 Nov 2023 02:24:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 15:54:22 +0530
Message-ID: <CA+G9fYt0LLXtjSz+Hkf3Fhm-kf0ZQanrhUS+zVZGa3O+Wt2+vg@mail.gmail.com>
Subject: Powerpc: maple_defconfig: kernel/rtas_pci.c:46:5: error: no previous
 prototype for function 'rtas_read_config' [-Werror,-Wmissing-prototypes]
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, regressions@lists.linux.dev, 
	open list <linux-kernel@vger.kernel.org>
Cc: Benjamin Gray <bgray@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Following Powerpc maple_defconfig and other builds failed with gcc-13 / 8
and clang toolchains on Linux next-20231127 tag.

  build:
    * gcc-8-cell_defconfig
    * gcc-8-maple_defconfig
    * gcc-8-tinyconfig
    * gcc-13-tinyconfig
    * gcc-13-cell_defconfig
    * gcc-13-maple_defconfig
    * clang-17-cell_defconfig
    * clang-17-tinyconfig
    * clang-17-maple_defconfig
    * clang-nightly-cell_defconfig
    * clang-nightly-maple_defconfig
    * clang-nightly-tinyconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build logs:
-----------
arch/powerpc/kernel/rtas_pci.c:46:5: error: no previous prototype for
function 'rtas_read_config' [-Werror,-Wmissing-prototypes]
   46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
      |     ^
arch/powerpc/kernel/rtas_pci.c:46:1: note: declare 'static' if the
function is not intended to be used outside of this translation unit
   46 | int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
      | ^
      | static
arch/powerpc/kernel/rtas_pci.c:98:5: error: no previous prototype for
function 'rtas_write_config' [-Werror,-Wmissing-prototypes]
   98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
      |     ^
arch/powerpc/kernel/rtas_pci.c:98:1: note: declare 'static' if the
function is not intended to be used outside of this translation unit
   98 | int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
      | ^
      | static
2 errors generated.
make[5]: *** [scripts/Makefile.build:243:
arch/powerpc/kernel/rtas_pci.o] Error 1

steps to reproduce:

# tuxmake --runtime podman --target-arch powerpc --toolchain clang-17
--kconfig maple_defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld



Links:
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324129/suite/build/test/clang-17-maple_defconfig/log
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21324129/suite/build/test/clang-17-maple_defconfig/history/
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9XaK95NuGJL9barjaXrOWxib/

--
Linaro LKFT
https://lkft.linaro.org
