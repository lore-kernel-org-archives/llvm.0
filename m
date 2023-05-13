Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85302262F;
	Sat, 13 May 2023 22:11:41 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f443080ef7so23918761cf.1;
        Sat, 13 May 2023 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684015900; x=1686607900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OmxjGDfjF/mdsU98I37esgs4VenxbTsH7hU7po07tU=;
        b=BSSPtXG8kQJ1Jm5sPNLCViqbC0PXyQDgHmnTd8t+j8yd6sQnWMi4v5t2cDDdMUE9jJ
         Jt4Lw60yeoCByOoQfgpsGGZB+Pq0kg87OdBvDDGYmMLjimLSQuDu120a3nRXa3PTRbhi
         zLseThj4id+9V6IZJjB39XpnD21Ce5nR4RjA+//Fg+DdpRlzs+bODDgjub/vNIYjFaEU
         Av2KKgDAXibJUPdExjyn0b2FWKr8TKQnQ/90g4KOJskYBoZZnBJcrbpyME8/pQDEtwI4
         QCqyToJqJ8E9IgGdtDWaBont8THuOzqcwDM2v2QTybXR76Nvk+9zN7Z6/ENBBpiMRZ/6
         nuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684015900; x=1686607900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OmxjGDfjF/mdsU98I37esgs4VenxbTsH7hU7po07tU=;
        b=A78kLikVzF+sWd+5Mr5pYI7zT6e7N6j4gxwJ0+4zfaK4sQul7L6GQhHhI0iPAYZnFk
         Uvba+3wafN8QYHqvBRH1O2K07GrHg8IAfwODfYxaKcGyrrX/feF7JRJoemwi28L3o0s7
         lQr0kNiE3H6X+IolliRMZMERRQzpv76loRbEf7e5VuKVEPZMR2SyAR+g2sMZ7+Cc1zlw
         xGRvAqNcaNFpsp5ayPMJ4pABZMi6urcUlMvqN33pULrQQje98vV+HR7Pf1jueQcKYJzn
         9sRiY5Vt6i1vge2ur/QoRjXfs4KqFRa6n8PHa5Tg+HwpO3XstwFmZIjfBVgpLEoJphoa
         KgMQ==
X-Gm-Message-State: AC+VfDyPGno1vKR5u4NCGL2j+fqXd7cJ1qYiAVoPzVe9Ho6nF5OpzsXm
	RH/D2rc2kPM42gvtC6LjF34=
X-Google-Smtp-Source: ACHHUZ7Jo+jb2jm6BP/QiHgDNobYYQbUGXXY5tzSmLY8qoeVPsb37mTbAH7eHQSEwZzw0nNy2M6DZA==
X-Received: by 2002:a05:622a:188d:b0:3f5:aa3:acf9 with SMTP id v13-20020a05622a188d00b003f50aa3acf9mr5239511qtc.56.1684015900411;
        Sat, 13 May 2023 15:11:40 -0700 (PDT)
Received: from tian-Alienware-15-R4.fios-router.home (pool-173-77-254-84.nycmny.fios.verizon.net. [173.77.254.84])
        by smtp.gmail.com with ESMTPSA id j18-20020ac85f92000000b003f51b00ad87sm268174qta.35.2023.05.13.15.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 15:11:40 -0700 (PDT)
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
Date: Sat, 13 May 2023 18:11:38 -0400
Message-Id: <20230513221138.497270-1-tilan7663@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <892f5292-884b-42ef-fe24-05cfac56e527@kernel.dk>
References: <892f5292-884b-42ef-fe24-05cfac56e527@kernel.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks Simon and Jens, I will remove the unused reference. 

And I'm sorry again, I'm very fresh in kernel development and still 
trying to learn the whole process. Hopefully this is the last time I will 
have to make the change (previously, I was compiling the entire kernel and
missed the warning message). Thank you all for being patient with me and 
tolerate all the silly mistakes.

Tian

