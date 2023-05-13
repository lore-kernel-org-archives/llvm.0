Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FCE2261D;
	Sat, 13 May 2023 19:11:20 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f392680773so39169171cf.0;
        Sat, 13 May 2023 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684005079; x=1686597079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bc2WbLcG4MisgxMfHuVQzIIOIhJWCXgU3kZiHiMOWW4=;
        b=D6SO0X8GRWtwf0ynq7LE2y9aVEulg4miuzULR4xEFc4KujHO7cKDuJidPi3F99jELX
         ISZGhz7loktmvxEHKb+92QSKVLIYc7ci1Swp6JRvl+At48WLSf02ulhdtGcwTEuJTlKC
         diIyVw47kwcT2UgDwdlKiQxdYFDhiwCsD7CYq29mOELiunNhnySAFUSLRRlfcNSm5qFh
         ie1huEprotIzOST89meE08jDNEZ7nIxd8Vr8VyS57fSIzu1E2BuuInhC5rreeiuiErj/
         Nx9OuwzUqYtGhPaAntNUjQ4CdlFGLrtzDKilkx+ZWzjHdb/hgjSAGzVj8yLu3djZMiMV
         sidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684005079; x=1686597079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bc2WbLcG4MisgxMfHuVQzIIOIhJWCXgU3kZiHiMOWW4=;
        b=NkrXfdZGM6/zqxtKk9N2La3uEwzWiv7H+txcosQvdm+AKNE5A+0M/0V+CcNEOqfTau
         uH77EnRORB9wxSItTiCkMfStjvW/zf7riS1fiifR9vmTADspcsPbLvrkjFg+rMDAfc/H
         j/Mx/hVRDzMb9eWda5yPZaqMqijTKpG2pGtzHkYe3zAXVSHOdCbDTx6VDYxTgHDINoyf
         +kVk/iKJy8aDFIaHOcef4zoa9jxqv8e29QBVspkuhhTp2ZD5XIFyQAOcJjG6GGrpoOrW
         SQukD8RlD8BTWoa8XX50GbFv8rUDsWjd6DcoqMNA4405zRYZt3fPp6U87DXjxIED4hln
         havg==
X-Gm-Message-State: AC+VfDwZa3XhYcAxhP/8wvepc0H6e147RBkOePNLaFVehh5EveuxCvWK
	tDe6c84qvb8E7p8e2w+UCXciDoSybQPBkA==
X-Google-Smtp-Source: ACHHUZ7WudFsl2vGq5sl863YxyQc4RJOBzDs06jD/TfKnoM6d2bWarqK6UOQCqwM0oaL+lL7wQw/Fw==
X-Received: by 2002:ac8:598a:0:b0:3e6:457f:9ec7 with SMTP id e10-20020ac8598a000000b003e6457f9ec7mr49760258qte.19.1684005079235;
        Sat, 13 May 2023 12:11:19 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id f1-20020a05620a12e100b0075939692d18sm282862qkl.83.2023.05.13.12.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 12:11:18 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: axboe@kernel.dk
Cc: lkp@intel.com,
	linux-block@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Sat, 13 May 2023 15:11:18 -0400
Message-Id: <20230513191118.331583-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202305140021.WvuGBjaZ-lkp@intel.com>
References: <202305140021.WvuGBjaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jens,

>> The fact that you didn't even compile this not withstanding, why
>> not just move the existing check from blk_mq_free_request() to
>> __blk_mq_free_request()?

Could you please review the change again when you have a chance, I made the
change that you suggested earlier. I apologize for the broken patch submitted
earlier, we did test the change on our production host and able to confirm the 
change did address the active request leaking issue. It was totally my fault 
for not proofreading the change before submitting it to the upstream. 

Best,
Tian
