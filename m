Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066378;
	b=O/rJaPYVMCIR1JII6fww2h57TbCZrlV1oFcmBI9OoPtnG7AkSOpYDbXLCwqFOUrb6mCZ
	 ZVV7jeg+GV1IXFlXkhy94ziN3qbsXibL64cuYwopNJofvJ1i23HlGzgX+6Nqvuhnaxrj8
	 Pj0+nAwkNnIqONgcaxlxiEi8PQMgB3SuLmQXDtuDi18qMWoM+7STkTBtqOOlYZtUZImLI
	 dctxDRXT+dvsABdwfJHkSovrWoWs0ZY9yJgTSoFcfbyy3BfvLzXnD+pRgc8xJU4p5sVYQ
	 cpe1XN7GobMUqPYU2Ujoiv3KG5pHdvMGu44Esk1uzVnWU5ayrQOo3QM47mXbIHo7h1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
	b=nJrqy09KLqXku30mOLcOf6s5pvQ79HG7Q1ibvVFrWLHuLIHUMAjdyGJP+cYu3HRBTJBz
	 h/mBnm6cbnhsQ9+h9GIiVzGnbb/7ZIlxlZGXaLF3sRej2BN3Oh+GjD4Zgf4rm9U0UlZD+
	 qjQNG8GpRRFwI558lkFseBDKZ4bON0DThd6GTpi9hrPpQTZY5vz+IiSAzWU+nR3MgbN7R
	 DQBgzCDkCo33lNN78/kWRQHhgDTucpFJML0IMkqtByRVFanD/TgsLobjtJ8Zmnlui5INg
	 4eiUsiF7yumbp0fNHducky/Bpwr8z+XXKWAPk7NxBEtAIoPj+edHZ/aRe3QLIEkdKkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPzEn2f;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC8606A32C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 05:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEC8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHPzEn2f
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b3a9a4a765so1049391a91.0
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 21:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795066378; x=1795671178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
        b=jHPzEn2fQXxgtyegQz0wPYE4ClKstKHsqxvLfNcMAc26cCxHT45xNn23fwJS4xO3BB
         iJQnXBrupbXmBeCw1KiNJov1jt6nGA7uGU4emrPLRi8nJZ2kZMfZ3hEJ0o4GhtgYui6I
         PyJOczFWvB2YxtbgLjJq4GjYOr+lvuORBRZxtElU23DuCK6FU1gyeRZXy/SgK8/yw3F5
         AAAuQunupe9jpHSQ7WH2TAM7GT4sis/9vX4KTlDOAs61bkCCg3c2Ky2TML07nyS7T+kk
         sDmehg+9KIf317z+IMnIh1uNg/vP38h+1vxb5VhS4TLlm1upLiW8uWG+g6jjDB/LHBT7
         GV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795066378; x=1795671178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2t+AFT2MA2m09XqavALNlhqgsVOoCT8EUnVMwE2LdCc=;
        b=ykGcqGWR8EWFf8uh4fYAyStlzbAJS/d2mSv3TSX31wZUD7YzJnAdop8vPZWq7i7te1
         BKSxsdfKv33w0Pus2u9AkFeXwXZ1q5/tuDoP2OKkYwAsNewGWw4Vk9+5Y892wjR+UoXw
         g0l0xKQoaXyBUQrI0jfYgjQTrR1CxGuHeVbEL3TiCfNfo81Zs6pa0nbktYFQ5wXqF3z6
         rWuaJ/Vsy9HFgjez/fKZCVacQJtOIYKbumuM5Vd39copKYJ/qXnkfokINUI1O3y9NE4Z
         MKWMTwjSyGPp1izB30wyA4AgnrIibeYdEVG0Zww2d/Ms2XraQFxnI90t5x1dcFx5GhOR
         LMyQ==
X-Forwarded-Encrypted: i=1; AL+hErEkQdg7kGxYHm9zoJDy2JVAhqM7hAP7GXKDSR/IIgGGtJm3u4cxWAZ/jnsW06WsVhkTa7nC@lists.linux.dev
X-Gm-Message-State: APuU4Z84MSIxUl1aSO+0awI6ofwo0TMEpfvfQ0C8lNHJm+jhvFx1RjgI
	AxX0NKb6FswV87IigfLgZa5BTBJhEI2ZPkkQ/xTN+0TS/MRjY01PDc/f
X-Gm-Gg: AZFdTZdXEIMj5v/t8HyJ3geGadxL3nBvCKUDhigjvDQFcAMBWPD0TBc5Ais2toEJGKy
	Nk/Zksy/CCnmT/H9TTw9mif8ArE2fbo3125OzWJkqFKwqUl10dIgvQw7T/7FbxGNYY5S9beDsRf
	GnAr6OYEr8AfGJ64UFv4REmkINDRlo9iKsVEigGykQHP1Yr9wEOX1pc51XzhXXhwYJWdx6VXpgb
	AIdk/hA0D4Ctb4IJsEB6lrjKoMGovkyNA0JIOo8+ZQGaHGVToSCVTbIctIEKbp6uQbDOW6CYW/l
	FhmOVmK2yhx/8ngpz3KpVVuHQh6TWQQZKzET73709oKUEYp5Zx4hRzj0dy7Mczh59mJqN3EbTSG
	WJXAWXvVuJ/XAE6hQNOAadzsz9r2zmegeSA7ZWanxAghQjU12cNIOmfY59JPDwP3xljYnq9+1Mw
	xdH9vLVHGheFA0z5BLxZxjQva/WgMXWVlnhLRarerMMCzeyO0igz4iC4b9iBufOWP4HQnUHvypg
	cc+hzIi+qjE14tiZl3o6Oa4rILD/HJR60Gu5i9YVqcmBem0DtQhhAWMuk4DsNvQRF7LPyrbVQLJ
	qqLJpHe+P9n8XwSUsAoH+ylvlRcomPdvcg==
X-Received: by 2002:a17:90b:28c8:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b3d075979emr5015646a91.17.1795066377601;
        Wed, 18 Nov 2026 21:32:57 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534aec9bsm1047080a12.22.2026.11.18.21.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:32:57 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(), fls() and ffz()
Date: Thu, 19 Nov 2026 13:32:49 +0800
Message-Id: <20261119053249.2098578-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av3-Nf01tdGw62lh@yury>
References: <20261117054939.2126980-1-shingekinocore@gmail.com> <av3-Nf01tdGw62lh@yury>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 02:36:21PM -0500, Yury Norov wrote:
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
>
> Would you like me to move it with the other bitops material, or leave
> it to Brian?

Thanks for the review.

Either way is fine with me. If Brian has no objection, please take it
with the other bitops patches.

Brian, would that be OK with you?

Thanks,
Tzu-Ching
