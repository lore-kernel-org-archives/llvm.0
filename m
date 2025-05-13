Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F5C13D
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 04:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747111331; cv=none; b=BczIxyL9+MQIfrvQ9kJP8jfkPBXc8jfT5noctXSF0GVPuKZK+0mAHFrN6jrvjbBK2rXaXufB9AIscr/IwOg4Reh2EDCDnLEQafNQjjAJWPVqgZ41CBQRm/RuSUsObswzX1hBKAFmxcfx/lcZX0QhbUIaqn5fI2ibXVENUwDIBG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747111331; c=relaxed/simple;
	bh=DKOky1A0z6pFoa+CvOT0EUjHmmjXd6CnUvQy6K1ZL6o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ANThmSc/23YF/H64Bu7fZt84GT5y4d8nqDm6gFmU7pkcML8cKlzF8NgQsTaUGg/fGnTH6pFxV5Gm8CYZHIhubyjtJ/OXKYHq8Qz6E4fydpPg+jpue21bKpRZmQzxWVhoRCa1QxnIW6MKrDW1KwM6q33RHEjuugXdsU8fHJn069I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9INJMJB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9INJMJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747111327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TcJ1bzM3kTpRwn6HiJKgH5b+DTJQZXG5VGN/vW1bltg=;
	b=Z9INJMJBUAUG3NpvaSwBrlMcKZeqf74MDwNKwD0uyM6Y/w2GWRnE9FM+YbrkD7IEGiQG7W
	4KQdXVtIIp78KweDO9ansZtYksCkgx4h/+g46Epkdl2HcU2VGScYi1AygjHGAXreKeTJgj
	zMjLQZif0c/6NocFFGwD7dmz+8BEKYU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-gsCP4hf-NMSgbn_6lbNF7A-1; Tue,
 13 May 2025 00:42:06 -0400
X-MC-Unique: gsCP4hf-NMSgbn_6lbNF7A-1
X-Mimecast-MFC-AGG-ID: gsCP4hf-NMSgbn_6lbNF7A_1747111325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01564180056F
	for <llvm@lists.linux.dev>; Tue, 13 May 2025 04:42:05 +0000 (UTC)
Received: from [172.20.141.161] (unknown [10.30.44.25])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A836E19560AB;
	Tue, 13 May 2025 04:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, e9565e23)
Date: Tue, 13 May 2025 04:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <87238.125051300420600261@us-mta-139.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T4V1Pj6MBm6GwroUBHoZxOGk7zo80B6zHOFIbICbCs0_1747111325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.15-rc6-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1814179395

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1814179395-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

