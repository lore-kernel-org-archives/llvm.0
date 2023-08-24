Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478228917
	for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 18:29:31 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-26fc5a218daso58766a91.1
        for <llvm@lists.linux.dev>; Thu, 24 Aug 2023 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692901770; x=1693506570;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1YcSecukI/DFCrztrORLNsZGL+keJIV6eV7Ksjr9Gk=;
        b=BOqwKncfGAv7/sk10fo5h2uyW0w/tgq6WrtbnuolTn8KoRL9jeuPUXIby9JnccqFq3
         CJHaRQTUzGjOy+/HSYJSbQnHhhApCmRk9X1EKYcx4HgrRH3HCGU/GL9P21pxsMRmJQ+e
         TxS+zIrVgqZmXS/K7OWgaxaH4QqkwdK6noTPb+IYTTDrjjPT2rFT7IpfzZOsP2FJkWld
         QmJ8/Yi7gahlB5c723fPBLLGaWi6WHhe+LvqlXg+XcXjTuoGQApRIyLCY/6hyoAi/iKg
         hMw+8S8hD2PiK4OJg103GUAMSZ9Q7OK40HoX4dQ3i19KF0D7DDW6EwiwC4eG86/Kd/TU
         AftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692901770; x=1693506570;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1YcSecukI/DFCrztrORLNsZGL+keJIV6eV7Ksjr9Gk=;
        b=eU+UOss5tZmEfzNrWzkuhFDgp7O42BLBXmSSj65MvLePCBNOM1ztNxoUoo+iimUt8Y
         wYkGSCr8WUD34uTjrx7dddFCbpkIq2iKtfk3dIWBsqjSPtnBGPtyQ7mVxd2TQO34b3RD
         PbYmLXe9dga46K3fNG2H+89MHYZI0KXatoBPvkUgNXi8/tUfvdoXgnVcAUbxSVGXbAiw
         8pOEOPGobPKZcJrQ2/DtVX0z11WuOCFfshy37+uQM4QnWovDNQYPglFF77oyb30lMM84
         pqZYzDUx2uLEh4N/pIBFJWs4BJTEqjWrZ32dwsIbCAtuB5IruyTQYeWOB0D49jTE7l2b
         DWSg==
X-Gm-Message-State: AOJu0Yy9QmFV+vj3SNhaNaX2o87raB30FrtKBIR2N/xRD0dmg65Uj856
	TTQpowP7QjoWbpkCKPWNA4LJUQ==
X-Google-Smtp-Source: AGHT+IEj3DSxzNiMBroPsK0WsOrwhwhGUAIwXhWz1yAAmXCG0m396XZ+r/VKHLDvYZfeoEJd6N/nvg==
X-Received: by 2002:a17:90a:dc05:b0:268:a691:412f with SMTP id i5-20020a17090adc0500b00268a691412fmr12818362pjv.39.1692901770550;
        Thu, 24 Aug 2023 11:29:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a68c900b0026b3773043dsm46714pjj.22.2023.08.24.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 11:29:29 -0700 (PDT)
Date: Thu, 24 Aug 2023 11:29:29 -0700 (PDT)
X-Google-Original-Date: Thu, 24 Aug 2023 11:29:28 PDT (-0700)
Subject:     Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and binutils
In-Reply-To: <20230824-cortex-mobilize-8b94e059e130@spud>
CC: xingmingzheng@iscas.ac.cn, Conor Dooley <conor.dooley@microchip.com>,
  patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
  guoren@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-a2e62840-6065-4435-a82d-b09054e8f254@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 24 Aug 2023 11:05:13 PDT (-0700), Conor Dooley wrote:
> On Fri, Aug 25, 2023 at 01:46:59AM +0800, Mingzheng Xing wrote:
>
>> Just a question, I see that the previous patch has been merged
>> into 6.5-rc7, and now a new fix patch should be sent out based
>> on that, right?
>
> yes

Ideally ASAP, it's very late in the cycle.  I have something for 
tomorrow morning, but this will need time to test...
