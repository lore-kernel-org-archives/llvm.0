Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF01F95E
	for <llvm@lists.linux.dev>; Sat, 16 Nov 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731772550; cv=none; b=CJNVUKV7HAAU9wl4rygRDhH5p4OPRKjTv3FgTpjhRMa3zc1kliMCOI4r1Mia+jlov6Nc6M4tZ+7Ok+ZrkEBDiI+xmsbKLbVGcI+wue/QPiuCiWUZaw/nMRQ8o653hemBPXye8DTuaaAQAaiXJqFFtbvzXQ/bfPlt0A6s9QIl1ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731772550; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=ptYEQQdeukSc8SZdpvWCIjI0BHd0Lo13xo8Gjd+nWyOj3eSJ1YLU0wfVt2dXQ52dApwS7V1hmHmAA6ysGs7AZyRWowU6UwlR9PA2+lvawkh9II00eY36g5Ai1inXsEJIuFMty0JH4EPqBopS4Sam0PpUckjwr52Xjjz91DWbVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0xoIll7; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0xoIll7"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-20c805a0753so27412045ad.0
        for <llvm@lists.linux.dev>; Sat, 16 Nov 2024 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731772547; x=1732377347; darn=lists.linux.dev;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=T0xoIll758o90HNyZ109NInYJzKTDI1WbzO1JW0+sB9C6V3NTPt/uZEj+q1MnEcx/h
         q3FZD03yNQEy3W+ul542faRt1auWVFi+7kV79GA0ifArrWnhjeLbSWqvzaQhjyQfxKCa
         fwU4j+AqCoAgzHW+afdlCoOiLy+GX9tLgXJoezrDi0ufum3ioUiwg8wIERMb3b7bfJOw
         hwV5lwMhDt/KSAwPRv5BOfuN69pw7z5YeuH92h8gYlb5JGx08QM+mmz1YvHbFJfKxInH
         gDWtoKnPkTj6Sya2OW4ogq6fSq5F92PePGg8peZ+80ith5EUMahD/5la33EN42y5kFON
         oNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731772547; x=1732377347;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=hA00blH4nDMEsRMxKaSotQnxAL+4n7nV3YVgF6N5S5zDY/fKzoPwhe7WYphO9RnsYO
         M5I8pcfIofv4pMSOtho3piWkBoU+y4Q7c49Y8BILRkR+ZF9kwJsIQVKt8ML06MFu7/Mf
         l/pv5pt4XylUSrwr+g479aSBQGgU3zCD6kXvJyDZPC9mNz1zNztlv3pij1XXDvl98ug7
         4bO+trCzU6F40pgSv8FsjCtqn2ibz1a5Dy4RY0yOMFVYuVq5XmbFllKHxFmtPARbZwSI
         zhJmiX74wf5oLfeINaIDToEbnY4Xm8kUCpDRo8AWMxKmJu4LjjvP4NEcmKRbGQ4sz7+h
         VFuw==
X-Gm-Message-State: AOJu0Yx+KLU24ha0JQySReaEiVizDgkF1duxMNH/iz1BmZGHY6Mj3TLO
	NwQbGVLNCN8c6s1/997d7xAKxd33N/jxTKEn2HQvCLiIzzJvjDalPttaDcEA
X-Google-Smtp-Source: AGHT+IFnNFe6k8i8DJiAsjQIxOS9MufVJuZAIgXC2wPHNG2ts2Je1opvIMvazgfz9QwnybOF0HMGxQ==
X-Received: by 2002:a17:902:e887:b0:210:e75f:e6b0 with SMTP id d9443c01a7336-211d0ec2e6amr104503195ad.40.1731772547334;
        Sat, 16 Nov 2024 07:55:47 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f4f2casm29093245ad.224.2024.11.16.07.55.46
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:55:46 -0800 (PST)
From: "Van. HR" <yongsaravia48@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <86f18c870fa78afe638fec9a815327e660b2625101833c7277dfc138ee0b8c4b@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: llvm@lists.linux.dev
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:55:44 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.

