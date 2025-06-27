Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6661A2398
	for <llvm@lists.linux.dev>; Fri, 27 Jun 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040999; cv=none; b=OoiXQirOO4DWnqiT2kGK05fVj0pGhLwYJR4VpSHAXNGubiM8ucN09PpQruWnrgL+jU9PqQ0l3A7lAp31ibWGdVKIi7ZC08CKgGoA7ZucRsI9o3SACnTPFr3M2d4IKcWoZYtu/LNYQlWzR+Sdb6ZOSW/XqRETuMTN/NaHs0tdAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040999; c=relaxed/simple;
	bh=5BCZIdNRkhUIBdY64OeUY7sVGNbJ/g40WgIHT6thUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfiAbblE7EyWYOwA2MwFSPNwclzVmAi+WMgkELdisXwNf0FIAWHU5In99It75u5lLGHe+RaUlrYb8cXEkLRbyfcWd78x/h7ojpSnmQ9TFW77XI/oaDgnpQ5ThucH9ox9UqpLn3/yNjcB6yj11qlBtdDWyuFuyuKLkO3yP+mG4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sn39G+04; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sn39G+04"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-735a6faec9eso29004a34.3
        for <llvm@lists.linux.dev>; Fri, 27 Jun 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751040996; x=1751645796; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=Sn39G+04dmHq1w6CG9xna0IfKCFd/XqjrOBj529ASMW1fctrZlUvsJ11unlIibAami
         p4gJehM/0rIsybVO/I0supsFv3wjNx+n754BTDiOw7vAVpP+B0mctVn0BnEQ4EK86S5M
         NyLjlOz2zmkjn0JgSU5ZMg2vaHPGUX5ZgmhKif71CZ3tXy89qAh6hZXttHv4OPxntztb
         EC9uXOqeeGa4Ho+jchyHS8RFRzgCcMyCd/dmuUSDr4bIgZ1cpZYmyuLQ8mzWAtIc9zyQ
         6cNqLwpicKW0iow/P2cWxqej2bEyzHciLqYSPprLX062pIMsvBzARizAdmfh9MCG0eej
         3w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040996; x=1751645796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=QwO3Jnh74NPd0kvd1YxmIhokgBe/HpP2v2EYln5ZDEGtbi2QJWmnj9AdNfH0BK2ckx
         nc7OUobP8h2rw7qdaa7ZdA6vQ9yq2JiLJ5Q4rZnhbU26vIExFrk0jshSTDvlFf0G/iUR
         Ns5p8UOarlAizH2oXd0rfYbfn7BS8OGC3RTJyFe0tc1osxqPlY/TllwatWr+7xDJ1ggM
         LPPC6ClzYoKvnmVoR83W8MPvcnI7118fVsmHFBzjgv+kzyi1Wj1bBVbDLPOoLxSl1Tv1
         OgSnndwrE+/Jp9mMKSudR9U2wYZxXHx8hxbDkwztTADMs1UtCkqzkzMoqNR5o8B9Ig14
         e+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVxfdhftUB+GW1D28D6SNR2PetvHdx004J2Kjwj8F9s9zYVaaXXhtSFLgDG0emOXwxJ8M7V@lists.linux.dev
X-Gm-Message-State: AOJu0YxmFjJGm/e+zV6WoKmGO3I3TjTGvJtdB90y8zwxdTq8KvTxxPqf
	wxzc4h/vis4hJbhNt0JyoNd7fGzdgM+QlVAZcJ1GV0+HRrPKwD2aTYVam4U1rnwW3/k=
X-Gm-Gg: ASbGncu2Bti/jIJkkJbzdZkS8S+HqRhsh//E7Xiz3CJtaSxWgFhvNxwgWv8kkV4AEPJ
	Nfj1CEwPvXulLBj37/1DQkwxjGYoBL0PrNuQIfMgt3QaLtm5tL08ecI9o/f1fPxjFqmTZ/SG5BT
	nHBkvLdREr8SeG/NZzjIh3C0iU6r/UdeJKtp6pUGlMBcnJcUfdbxAJiypGbaCldv42vddVkBGm6
	Vqo0c6FiDq3tc7MEQ1QbJoPncxZvNAmu7uy/nYYeqex0huTUQXvkvCm1DlrCsmOZQxE92XmXgAM
	9shaQXmBb2yzc790gGlSrKP7y3c39+7uQWGru0mMBMJias5FE/B6oUjoIm6kI96B00qZcg==
X-Google-Smtp-Source: AGHT+IHSu+h2Kzxlf1fk0VB81UI24jyMyrVK0+P5Y1H7EQ3VQt8CFFGwqHkfpVATJdlBq2OYHofbSQ==
X-Received: by 2002:a05:6830:4d87:b0:727:3f3e:53bb with SMTP id 46e09a7af769-73afc600f17mr2265204a34.24.1751040996481;
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e2ed7sm406749a34.35.2025.06.27.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Date: Fri, 27 Jun 2025 19:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <0256dbd4-a08d-4549-a520-63ee88eb3c1f@suswa.mountain>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>

Heh.  No.  This patch is way way way to giant.  It's 80 thousand lines
long.  Anything longer than a few hundred lines is probably suspect.

regards,
dan carpenter

