Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17E254864
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014388; cv=none; b=da+0rhtgyT32FnURlxqKrFKzyhJ2XXSvCMyzRnXK1JsZ4+sQRAfi+Nk5cHYC4q6Pnpc6cIOg/Lu55SYJkJyXDqDro3qMHcy2l8uV/RiruIhVjKjUSBBcPSDQpcZM2SAQm6J2p769Qu7meAq1SG6DV+KZWB3INNdm5mQZooqmCZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014388; c=relaxed/simple;
	bh=w9rUKcWMLxk2k68tYEO3Z/nAGzZrEh3w6mBl/3EEfeo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Cs39QyMsfUcCz6fBst0fA++SwUHB0PHvXY+KNR1jpvp3DA2TYm/P4JCAxWvpJydmmZ+4l5PZMVJyUwnaOsDVTUTcJ5PV855RJY6MkfYiSkCWVhAo3uJUukrTll8tZeWUbwwgsO8wORRjI0wNZI+sW6UJiHBcRLb/D6Dzkbfyexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qu2yWyuB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qu2yWyuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745014385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cCevl64ZwRT+I5PAbqNygWrY/He2s1YI6/99vetWyK0=;
	b=Qu2yWyuBNeOhPEkXDANjkaCb3c5IlFUFg06GOipxXXFFTDh4FWQsmlnOSXrl+fr1MrFMPn
	ZXu5xGxXBhYeooOGUGifmDHZ5tK2QK/hoY0dc2t39SSkPV+ylV0Z/dSGxfuuPMWpS4Xllo
	pumzpdGE4povCQXmGWBY3n9Yuqxu5co=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-I_DvHZAqOKK_PhfvcofMew-1; Fri,
 18 Apr 2025 18:13:03 -0400
X-MC-Unique: I_DvHZAqOKK_PhfvcofMew-1
X-Mimecast-MFC-AGG-ID: I_DvHZAqOKK_PhfvcofMew_1745014383
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04E031800368
	for <llvm@lists.linux.dev>; Fri, 18 Apr 2025 22:13:03 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78DBA30002C2;
	Fri, 18 Apr 2025 22:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, 84aca3ca)
Date: Fri, 18 Apr 2025 22:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <89432.125041818130300619@us-mta-231.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7AcAR7BxDcz5qiIpfGSxPrpdYt_OXXtmt1yGrEP2ms_1745014383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'core-urgent-2025-04-18' of git://git.kernel.=
org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1775869354

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1775869354-x86_64-kernel-debug


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

