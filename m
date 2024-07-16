Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DF1E861
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142055; cv=none; b=hdNs+CLL3CWW2B20cCvQWEQSUKxkY5IRryrlnfLDzXp5wTdb4kfhMevLsX3KPiuDn/84qx8g7hEy7FmkzGmPPv9Upl7Z+AeARTVVrAKg477jGXbFHOwcvEecIDdYBEqfHjUlj24pjFCqHuLutRwcCea0LEWFGZjmShAj/fHUwB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142055; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OyTKy+MhHWXvNiBQbSoC0TlBd30vyeg5sN9cKHuhlXCAGXkgT8+5s/75pwoeKHrMBhpdAycZbAQqVKWuUK4DP/nudBW+p4IfZuO7pfW1dzdhlSDLcgM5F0jCi2wrZJYLPCkjh92e61BGPvTUq0auq2NPDz/N4QzgDRkLfkTCflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gEKrWSqm; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gEKrWSqm"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-38b3543541dso176515ab.0
        for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721142053; x=1721746853; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=gEKrWSqmT6blc5/9X9JPJIES2WvF9eF/JJADL0KKh8QCsDmH7GDQzAmbTagrEgFu7E
         eMr78QTslcyHkvupG80PxXSmHhjzuzP5pD6he+ZrzpC7gNtJ8PMbiYCmJVHxLXP9td9/
         FyAVTvarByRQZy9QZaWEsmdbucvlFgcRbQn9+HBKG5+P3OijsWaTQvOIT6gyAecIMoyq
         UBv/bc1Vphxcfg/g9X31Ui0Hd0lMO+tuGkRfiJKHHiJJzep7YCvzYwSAojZSzLyKlwAx
         AiGkJzHleq3WmIyD3NWJn2nnp2NwVWqWlEBRWn5J5QBdmLuVPkfEX9iN9gYiYDOQ7RPf
         SQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142053; x=1721746853;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=vI9xtZtMzTGOLF7SiJDVGxRs4WDSu/zZcJpvc6GXxLam9uCotLpg62Bxa5YpnChNnI
         r6qCnGKhOhfmLZCByMxsHvfnzvCZ8ky4JXgRQNoX1Gp8rueZf4LYQlOQOl+OeHt0Y5wJ
         T1bVV3ulG/J9jiaREMpEdb2urJP5SC2CuGXZjVf6Lp/sot48y3wIKBvRJ60cBhIHa0WZ
         iImoxibYPps1yCO8PVmlTYveH7D5O+bKmEPOWrZaVNwA+ELZ+gbwrs0wV1jSdmHPpQW4
         nyN2WpB2lGiyvE7/8NIEb+HdH1ELf0at22+du/qoULSY6M1Cm9E0+Zgvb6G8cYQTyANO
         IQgA==
X-Gm-Message-State: AOJu0YzK6xF/Sz0M6mkp2sgPfGK5fWZLjPdi1AtbjQg2vwMwzkf7+AFq
	rIl0Nv7PnZ2ur4aJiRyteSEPxXyeyOAoOAe5qvMF3UesT62m7HzIDw1jlNPQvXRwegj8sUixoG4
	bAyLAXrXSxHCDdYAPGd/VSiX2h6zlXL9O11Tuol/E7YKeux/jrFUg
X-Google-Smtp-Source: AGHT+IH+uG7q/vY+iT6aAJe4ULoeZkWd5GqZ+5s54jKn68vTK/2PPinRp9HpjfUrK2rTK/oZ/HNKUTf/weYcqRvPOf8=
X-Received: by 2002:a05:6e02:1a2b:b0:377:14ab:42ea with SMTP id
 e9e14a558f8ab-393c11957a9mr3412175ab.16.1721142052700; Tue, 16 Jul 2024
 08:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Jul 2024 08:00:39 -0700
Message-ID: <CAP-5=fUss58aqUttouV1Pz=SgQzOCqN3XY5=en19cWJLF-vBLQ@mail.gmail.com>
Subject: 
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"


