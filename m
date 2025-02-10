Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF51F4629;
	Mon, 10 Feb 2025 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207907; cv=none; b=TBbbhB8nYKGzwgLtFa7u16Xjz2KDeD+G2413iaQN0vkU/HtIIPkWJpm0qMuKxiigVYbxymnriSGNomu08KcCUuQrJWPyAXETTEhxFo6jzFtv9kL/cBmxd+osc6ZkLmRgncqGV+dmJRsFlGFO4DGw0rQtW8mpqHgg4/vLO/2x1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207907; c=relaxed/simple;
	bh=VC00JklNOrgwjOXHHIYgIMfJnTeRDFzcAi5RpR/TxNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsNyiZVL4BXaDy6nxVi1Zg/dKv2A4UsgXsFXCfATi9XxkaIbCugV+M5UBaHP0hS+ajXIntYjJ0+WVttV5HkhHgkgVFcWNTZOpXSsH2yC17K9OKP7B+GGUB+mW+2dj8rJCd84NBtX3dVhxsCOVitjsR939d7pzVioEsAI7J/bx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot1MiNjG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot1MiNjG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f6a47d617so36331005ad.2;
        Mon, 10 Feb 2025 09:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739207906; x=1739812706; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6Hr2gj90SAJvZYYKvX3lI+NWXPn0IZtRtW+Ba4PvwI=;
        b=Ot1MiNjGlWElkLJbEX2OwAOUn8N+QK8hPCnw/KylPxk61shiDsmaY3q5SpbkExXft1
         sKiUj34682B/Ds3urDoJZ0hEwg6rQMTreuw0iEYcceYp3uXvu4AMXW2c1RZOo+KqudJd
         XzQPWRjaX/yNxCJQziOhDq6m4c2L1bSRJjr4OpZ01tmCc8qLN2JHZETmwVX09rVHfcdp
         4viIh9xgFALdSS0yt6TDJL/fg15A805Z3l1CqOqdVoE4Dai2ibsLHWI242OSpQg6SSTh
         KWQXj5Sc47WNPrtxXUIOX4J8z1i/B6fTE44x+gbLGkhfTB1tjx78f6eToxEUFKQetG6/
         qHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207906; x=1739812706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6Hr2gj90SAJvZYYKvX3lI+NWXPn0IZtRtW+Ba4PvwI=;
        b=RybbGfWlnZSDmg1Yh1nD0mBjAmr7CQrE7gqc9kmz9S5QbeX/HgcA6w0NF/lYjMT//h
         aE7WC4afJyNljpe7BuovGcLBgoqCrDMFvf0jWIHW4NnxsY75Vkk3mMMY8DlTgJVYwmym
         n51nKcpPXV9K8GM4EP2fe8rxxXEUj6rxFZYyaoT+vnJUqhUJg40WjiAVgLk3mLkD5Pwy
         KriOi6kV0VHeeJw36KInzhPjUqDXC6DAVwCzLGpPsMdtncz8n2BijRSC5EO0SBzj9ug6
         5Eqsafglt0w0EGOY8Almygd8MeCA1wkWwxFThZcHac/YIpVUaTft3901JClKW4yR0DqJ
         8Nlw==
X-Forwarded-Encrypted: i=1; AJvYcCVAlICneRkGniHTybeKUZSKPfvx41/kkSXflkwy2NuR/xCEcb6Yz/A7A5cR9X+CdT0nm69G@lists.linux.dev, AJvYcCVsj03HxkQnu0N/YOogZ+GafcAzroFWh+pmDs6ftEYa3uc6wNMPXSdq5HvfgzvVreoJQRMM33BSbWOWcsV/KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSy997KY9y+Ja/IyudK3aBhJCf2DdZH8evxjPvmYDd1ihoxpgV
	VE6dca29P27p0qFH2Ym7MAiRvYG8kneH4fviif6B/WxZuEu8dn+7K/fOFJ8L+qIA76d85/g7woI
	BiG5Kb0nifNl3AmKvLfdDdw38E9cOkC3ViQ0=
X-Gm-Gg: ASbGncvKIF5QXQY12WyR+iMF/Rr8W5rvUPH0d4IcrbDgQ2OayleCmxz/hyA0UZIjS9e
	JkTPYLG6TaoJi+1t5MxuPqpFgIPJHHpsHmIpceHzp+Wdf6gmVRev1cZkdS1Jnrpnw9W0mbyr/
X-Google-Smtp-Source: AGHT+IEXZ5lqBOERsIeVCEiZf+6SKGWkoAr+EjNWtFeKsutJOZCFiQi7Te+5lhD9Pf+7cxxxQEYooMyUXelC0GOYWCg=
X-Received: by 2002:a17:902:d512:b0:215:b8c6:338a with SMTP id
 d9443c01a7336-21f4e6a05c0mr236794695ad.4.1739207905763; Mon, 10 Feb 2025
 09:18:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207203441.945196-1-jilliandonahue58@gmail.com> <202502082022.ILQXjseT-lkp@intel.com>
In-Reply-To: <202502082022.ILQXjseT-lkp@intel.com>
From: Jillian Donahue <jilliandonahue58@gmail.com>
Date: Mon, 10 Feb 2025 10:18:13 -0700
X-Gm-Features: AWEUYZkEYqytkrljgvhIt2HQh3vA3pz_JwF1sjfbnL48BEb20zELvkxqTlRWhmo
Message-ID: <CAArt=LhOBqH-qZVkdBsh13Csvv1GrDBqakfPGjpFt0TF8KBYsg@mail.gmail.com>
Subject: Re: [PATCH v3] f_midi_complete to call tasklet_hi_schedule
To: kernel test robot <lkp@intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ah yea, this error happens because in this commit:
https://github.com/torvalds/linux/commit/8653d71ce3763aedcf3d2331f59beda3fecd79e4
the tasklets are replaced with works. Should I request the patch to be
in v5.10 or should I update the fix to use
queue_work(system_highpri_wq, &midi->work) ?

> >> drivers/usb/gadget/function/f_midi.c:286:31: error: no member named 'tasklet' in 'struct f_midi'
>      286 |                         tasklet_hi_schedule(&midi->tasklet);
>          |                                              ~~~~  ^
>    1 error generated.

Jill
