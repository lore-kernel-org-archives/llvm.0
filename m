Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E8134CF
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 20:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577638; cv=none; b=O7RX4NxHdT9Lh/YKPYTIQKxhrSa6WoP5kU7UmOO/q31KczHsucga0snS3dldm7vbWJ79vBt6+r+UK6lrp62rXW96N6N4eBsepqWhA72hSENpEU+k/+TecuC7oCKp8EP8OZ9BHS1rlLT2SwULFgrAc7CxpedpR+5gO9DDCvfwIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577638; c=relaxed/simple;
	bh=unLxEe9LSSVmcXoHihpmUinadoH4l9P6EpdzeKBfsgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AiCuxjOrhWUxNSvsSKU2/DkE8NnO7IyaipO8aKIr02s1bu/Zs2utr87A+yHJne8OiQE1K2Ak8NxoRWcYmylYbk54VkKoYGAPy8soLikyW6ERPQPqE3viZNvdBWxKBuKK9Jl0nDhecp1mMc++qGWhy5yw9IAisgPk9mB47GFr3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmcoISyt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmcoISyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784577635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
	b=JmcoISytZTtNtQmazi7DnEXva8r4dkh48r/xrzKEPCQfpvX2FJIok3CeCNPByaKyxwwZMR
	Sl5N5kfNM8g/iPmjqtRHn3MeVEj1XByQf+Qrk9eMS9lcLRzCaOLR3rK9/1t3i2f4s55fT+
	HTdn9dy1A8xQEOCx54GlCWEr91TFDZo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-HgdL9uyhP9apBoTSQYP_Yg-1; Mon, 20 Jul 2026 16:00:34 -0400
X-MC-Unique: HgdL9uyhP9apBoTSQYP_Yg-1
X-Mimecast-MFC-AGG-ID: HgdL9uyhP9apBoTSQYP_Yg_1784577634
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so177570836d6.2
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 13:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577634; x=1785182434;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRma90vk9cBe1MteFqC8fc2rP2On5MIBbYuESB4mqpc=;
        b=OmW8/Dv81EfqbztcAyyCnliYGpsTHiHTlFmp8sBfGnvoyEVz/r0q5h5+ZLk8RPuC5K
         RzLw58tkw68VTVkD9WPhEvO629cD4oTbxqJ95qdhdlMLOV7Q4yAyMGOimaewMxfSt8+R
         spF6e0aDUiLsgg3SoBKWG5CcC+ZT8RJS8P4vWWVhF4njYvxR00dNz0eNigkFZypo6zrF
         oPzcrs+y7xFyCksJS4Vap0rtMUk7sG/KYDiQwrRyiFuqSzm+HQKmIEzoqLqgyNyNGtYw
         coFILvrY4yNHrLxNIHjeBNnoPALeUHY3nQO4aQHcUO81IgzoarWIXaaoadMQZsM3mUX0
         D5Ig==
X-Forwarded-Encrypted: i=1; AHgh+Ro+D8gqhRGeg3Ld1+Pu/XLFEcwE/En5FzS4f5b8YwbWWfiRP48zpakXZzwvn9uby/4qXHcy@lists.linux.dev
X-Gm-Message-State: AOJu0YzjLTzK48GSj2j/rbtDCzWc+7eTKJThaSCnDTu4lLxtC7bDyTpu
	ojrRJa6VZlqEDROQYf+2ff5Uo1FOhtkePAZaeSo5+M/wBmvke3KB3C3xjYZzJhPEMT/P8qMx2Lg
	Iql2+K48gBBiHsKtVcfvTFNhcFMX7fmx9GjfMmIkqHDR284EyPlS6VO8=
X-Gm-Gg: AfdE7clBLUNguYNMFQXotU2XzY+NN5TQbB+a2S5J5PbR2LOgw5bQSWnL24SVAVMnLw6
	Q1Oowhj5Hptgb9AbtKJHoiRs5nOsmnqWm2QZZ5vl7t0kNL/oSzwsABoEk+J2jUy4ccYH0XYtqVr
	iB33Fkqo0GeLpJV9SrbQaLSY59BYFVNcQRlAln/BhVsWGz46DhOAv4c5cv6JG/07DKctnVTVuyV
	9WCCP+9b6RRK8BNBdnHtaRDkz9XE5kOCkGKe+SsCKSFu/SFlz91e12yGQVUfV/XVBe2LyEB+SeU
	yPdaPoai2yOOnRT67GOwV2YqjGV423A4uGGXTWZ9FpkMnIPocZtnrJ1wfFXr0dP8RpU1N68wkzn
	/iGdCQg0Iy7xRzVlYDUvXZaQFxdxIIw7DQSE=
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144964431cf.25.1784577633503;
        Mon, 20 Jul 2026 13:00:33 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:257c:8164 with SMTP id d75a77b69052e-5213c5f3e47mr144963511cf.25.1784577632627;
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f5fb88esm81796841cf.21.2026.07.20.13.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:00:32 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:00:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 1/2] clk: stm32: add missing bitfield.h header
Message-ID: <al5-XWhDkr2to7qt@redhat.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
 <20260719215040.767232-2-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260719215040.767232-2-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oA3DCf86u801deB6i0irMmlEK2tS-ymLV-mG_0DhcqU_1784577634
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 02:50:39PM -0700, Rosen Penev wrote:
> It seems some ARM header includes this and the build passes there, but
> nowhere else. Note that the driver has COMPILE_TEST in depends.
> 
> Fixes: 37ae8501cdb0 ("clk: stm32: introduce clocks for STM32MP21 platfor")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

