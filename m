Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66CC2F7;
	Mon, 15 May 2023 12:28:43 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-3f475746ae0so32802001cf.0;
        Mon, 15 May 2023 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684153723; x=1686745723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1VjVPqAfk/ppRiX01W6r2R4tRubSTNMzE3oD3ueN2U=;
        b=ZWDv4c2aGhq+hVZZ96wLRricYpRxNLMwIkL+8XmiKvlkArDwiiYYvmPfggoS2OsHC7
         DpDf88cplcY6csuDKDFO6cpBgJJpBs68+CdJGqkP4x+VH5zCWcDSxki8LSf7cP7nPu8i
         ZFupC7LU7OoOZXbxL88NV35zuUChWS+ZeDzZVhn8VU8h4l7X0yLZ/s4OS0AP7gbp5LCa
         lsRGsdodNgPPhcxoOi4ZfiOk3a2Tnkpehrsw07T/1rPQ+rw0/PDaHD94+LYK4pGG9eEx
         iHEkWpw0kXB29GIdZBGE5XbQKLj5ct/SL+IAPnZBFokfH15IFAx2f0OS8pkoumQEs3nT
         ehUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684153723; x=1686745723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1VjVPqAfk/ppRiX01W6r2R4tRubSTNMzE3oD3ueN2U=;
        b=I/JV4m/+x1lfNcOfxJH2QflXzUSeZ8wnuaStLPkLq1F28xAhPfnxp5z4R5MOO03rDY
         vFFvVBI+3YC7WtjWRpbfukfRDnq4msGWoNzwmZ+1qudkPbr0ahMs2XlZ+bTd6yBJrHdG
         LtStk67KuImzRgcsVN1ExVwBxFfENIW1dvfpCu6h4DtLVvFIKOJin03wczQN4chXylyq
         JhQavPqg/JBMChp71s+0OtrwYyqwktZJy+4uMIbvd4zYJqkDlXBFF0PjskGrNRCLbajQ
         l+tma5ZtYKJ4jpDLaU2FS65KzpAZLNbUCEy1h1Tl+UXqKbxW8hmthH2ddkmTKYdjvhat
         pgag==
X-Gm-Message-State: AC+VfDzzZPzfIOnDedzuXdqN3yCcLXpOznv2zgGTD5hMBF6K97O/mG4H
	jXnhN/NekAJ5Ebm450uV7YE=
X-Google-Smtp-Source: ACHHUZ7TsAlETEjPwHwpArVG57crjnQkJXO88HfoqSd41LsVLHtpYRU3+JVmPWC0ZJJEqC9MDT1G/Q==
X-Received: by 2002:a05:622a:1ba4:b0:3ec:4705:d20e with SMTP id bp36-20020a05622a1ba400b003ec4705d20emr50519945qtb.30.1684153722836;
        Mon, 15 May 2023 05:28:42 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id r23-20020ac87ef7000000b003b63b8df24asm5310066qtc.36.2023.05.15.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 05:28:42 -0700 (PDT)
From: Tian Lan <tilan7663@gmail.com>
To: axboe@kernel.dk
Cc: horms@kernel.org,
	linux-block@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	tian.lan@twosigma.com,
	tilan7663@gmail.com
Subject: Re: [PATCH 1/1] blk-mq: fix blk_mq_hw_ctx active request accounting
Date: Mon, 15 May 2023 08:28:41 -0400
Message-Id: <20230515122841.602259-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a685e5d2-5da8-2ff2-c53d-dbf77fa9609d@kernel.dk>
References: <a685e5d2-5da8-2ff2-c53d-dbf77fa9609d@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Jens, this is very helpful!

Tian
