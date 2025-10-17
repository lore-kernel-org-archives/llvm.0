Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18D83469E3
	for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706736; cv=none; b=ZwryfF6UUlIfs94/ry7WyJEmMSpKu5W/8XeTABxfpUNLpYnUi0CJuFbVoQB4pB97AjXaFDWgM9LNCLkDX0eJAgzmgWTGqNlR+4046qzDghIZ4OPpy6+NEsYOAi4y80czhs66FOhh7fGorvXg6K6IszdCe59U96jWBPaDqpBJRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706736; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qGLaFRM00lDxgBbzY9v6EzJgkI+W5x8j35tCXESA7ByGki7GnUotbbmOwV8Sd5YcUjR0FSauXEBowWqntUbdYNO0TclA0tgJYqxj0ycEde1pC1ArbbtstiSQZ7Xusm2mOf6ADyR1Br3IxmJia8/QwWkADDpchaaA+nMkNv/iPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=pvwxA3+L reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="pvwxA3+L"
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id 9F8954F58C59
	for <llvm@lists.linux.dev>; Fri, 17 Oct 2025 07:56:52 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705813; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=pvwxA3+LsgY7S+MYstbXYOFUYB0kd6mrBWvHMITfhXciyLYKtKa+Os+BD4H5c3RaTi3vqN
	A3fEMj30+wm3OEGHdxfcam9zyTrk326wKqk+tZJ3zlCaRV+8IgAUE92TkrmNp2YJaQFSjs
	L31QS/aliDJu/A2tyxbwis315FM9mul4eirYVybTHXIBFiT3hLIBuNnTn6cLxYAdA2qvOO
	oVegNcgU2jXizElnIVCORDEDbAYLgpOzzHFKNgMx2or4Pehm3dLzmSexYWGm9EbNbjRtsG
	fNHMmALHPpUTrJgNMAGdjEOfUSk/3LBPkxD/ZKuthSGBugeWTFxo5EUrL0wpCQ==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: llvm@lists.linux.dev
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:56:52 -0700
Message-ID: <20251017055652.A28289709EAD1DD3@debtmanager.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.
