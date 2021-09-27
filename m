Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5713FCC
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632754683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/qaQ52OCSwFpVVEZfRM30bFeuqGacykcW5CTOL4Hw+o=;
	b=O3QCbPI5n3rSGGZ/KU+kXIkF5RHzDx0Ae72gEoWaEEiFC20ZbY5oexrDoAG523zWgKLR/3
	8RGhQ3zkzNNM1gyMvJUrA4wK/1ckcPmbcnd7vkpUPfzTosy0O32WDGyBlwPrNfsM+zvZ6t
	nN0PVhMuXlM8gO1b5xFlC75vquAcVuY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-Vmd5p8gBPCmyJnP9XGGUnw-1; Mon, 27 Sep 2021 10:58:02 -0400
X-MC-Unique: Vmd5p8gBPCmyJnP9XGGUnw-1
Received: by mail-oo1-f70.google.com with SMTP id m10-20020a4a240a000000b002adae1d3d06so14629542oof.9
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 07:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/qaQ52OCSwFpVVEZfRM30bFeuqGacykcW5CTOL4Hw+o=;
        b=UkXCPshPgOf/jJcDRzabetSnl1tEqPtXa71oocwczzNM5zoYr/2q8yoXSac9O1WqVp
         nHNCQo97alzwl5PvMADmz7P7YrsbpXzefCgCvgPu/D/0z/nBSZ8xU899vxzJMicSaXiL
         MnC5b5zFcygvxkIyLXPfqtj4N5jnuafH/4XIBB9xFq/M42cFBLV2ErvhcElUa64dFfPS
         pozUplGO/boF6CeFyRxw/IJ0+iUlp348iOjd6EiYGRn3WPkALcZJjisdw317tby/orw5
         hHiyd0deyuCoL5JRQUuWhgA0xCAPd9wZ4z4fiyeD156qEO4a8CGhqdeoi//joaMeODSO
         gr+w==
X-Gm-Message-State: AOAM530ptV6eNK2/z484orRAm6vkNhVG0gDlFC46bLxkzLqg2pI8LBl+
	yH86hLBj13k/XIHQVt7n2x3lF/k3FaN10qHX4X0JPKobvFf0zQDpnfOOqQZsaRiC1d6SoKJFq8s
	guUkdA0buhg7pOA==
X-Received: by 2002:a4a:bb98:: with SMTP id h24mr289352oop.23.1632754681725;
        Mon, 27 Sep 2021 07:58:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylMVNIDafwx10dmiiwMoOTn6BhavxYcofPK/B8LHY++vRWRcLzo0yq1S4cRF8RSXvx5jVdoA==
X-Received: by 2002:a4a:bb98:: with SMTP id h24mr289316oop.23.1632754681214;
        Mon, 27 Sep 2021 07:58:01 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 18sm4061748otj.10.2021.09.27.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 07:58:00 -0700 (PDT)
From: trix@redhat.com
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] locking/ww_mutex: set ret variable on failure
Date: Mon, 27 Sep 2021 07:57:56 -0700
Message-Id: <20210927145756.209435-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Building with clang 13 produces this error
test-ww_mutex.c:138:7: error: variable 'ret' is used
  uninitialized whenever 'if' condition is true
  [-Werror,-Wsometimes-uninitialized]
                if (!ww_mutex_trylock(&mutex, &ctx)) {
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On this failure set ret to -EINVAL as is similarly done
in the function.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 kernel/locking/test-ww_mutex.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index d63ac411f36722..7dbac5dc02efb7 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -137,6 +137,7 @@ static int test_aa(bool trylock)
 	} else {
 		if (!ww_mutex_trylock(&mutex, &ctx)) {
 			pr_err("%s: initial trylock failed!\n", __func__);
+			ret = -EINVAL;
 			goto out;
 		}
 	}
-- 
2.26.3

