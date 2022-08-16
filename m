Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B11376
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 08:34:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k6-20020a05600c1c8600b003a54ecc62f6so5016871wms.5
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 01:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc;
        bh=ciQCtYxE5OeI54BWwBXnv1dRIPzaoVFiw/iyujuINMY=;
        b=OrE4oADSMqz7zyS8elH6Ci1g/0g16c2uqilQmeI1zk39fH2ByzqwYNKaC3kE2bbE8G
         ToYKtmd5i8HiPqpYpX7izvsCyVSYFRh0F9Y3Uoq03wxDzyJZDDZRZ7ihd7WKIU46q4+w
         wlJGC3g5hHIie7S/A4jJCrm4aLsXDRclxq6LiYy0i/IsvtDkYAbhbX0oVG3Z5jVxZx3/
         dpXzPZtoYud6xMiMT3f/xZK95mQDOfTfth+1E/LB8dCb6zK7yGjYwvg0NPN2DPQ5x/vg
         u70vAxXfWDVH1g6C6SGkkFsRT3QpSGX4oQuAF/GkKnsPjBhgZHHHSoQdRvN5irqSw75C
         vxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=ciQCtYxE5OeI54BWwBXnv1dRIPzaoVFiw/iyujuINMY=;
        b=HriULTmZ3SRiyGuXfxlyEFJMJiYw88+mkeWVCZDv0VnN2KhtLGyg8RHmjSRZgd87Q1
         uKDs2OTdgGpt+UZB4rIr5eypA/aNDNerVb3hVEj/tZ3CUPkcYjHuOsZIqtBThjyH6FwL
         eU7jalCCUFCo66732+mznxIIfHUTtUo+q7YaDYOVl8w0cZWYSrJXUiZFc3dOppCdqn1j
         V1FTazeDbp8LS9zSmPIRwVT/NwSe6NYzwYyNDIhvGKtsHV7NGXwUKxT7SxFo8hUX/S9I
         BQqM0fVvEHTlVJ+Wb2mIP9912JLW0ABGJuzfO7UjdGMaN6DJilga7SQ+dHSzKcaydr1/
         TbCA==
X-Gm-Message-State: ACgBeo1M9vJOnktc1O3pL/fPPE/wL7DlSGvfSnOoZOfbK99ra4Jygg6m
	6MHt4jm0GrD8cgmueeSKwEjj7KdPM2O2ew==
X-Google-Smtp-Source: AA6agR6rZd8CLp0UzoPwNzeXEfQGy5PLS4FqaOQg2ZlJAUvkSWjygPeQNm1NgpUGe164XrgQ3EnWPw==
X-Received: by 2002:a7b:c852:0:b0:3a5:407a:76df with SMTP id c18-20020a7bc852000000b003a5407a76dfmr12203249wml.101.1660638880481;
        Tue, 16 Aug 2022 01:34:40 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c191400b003a5c1e916c8sm2372420wmq.1.2022.08.16.01.34.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 01:34:39 -0700 (PDT)
Date: Tue, 16 Aug 2022 10:34:38 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: llvm@lists.linux.dev
Subject: clangd with Debian cross compiler in compile_commands.json
Message-ID: <20220816083438.ec2imfkh4swmwxye@blmsp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi everyone,

I am using clangd with the kernel using compile_commands.json generated
by 'make compile_commands.json'.

On Debian with a cross compile toolchain (gcc-aarch64-linux-gnu) the
commands in compile_commands.json start with 'aarch64-linux-gnu-gcc'.
Unfortunately clangd doesn't understand that and I need to replace it
with gcc-arm64:

sed -i 's/aarch64-linux-gnu-gcc/gcc-arm64/g' compile_commands.json

Is there any interest in letting
scripts/clang-tools/gen_compile_commands.py do that replacement
automatically? Or am I doing something wrong here? Anyone else has a
similar issue?

Best,
Markus
