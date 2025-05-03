Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37451624E9
	for <llvm@lists.linux.dev>; Sat,  3 May 2025 05:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250388; cv=none; b=o68d5Nbi6oDa4Tu/adZ6kpC/vKtziyp7VyqU2yTKIZQcsSrCqeLR/QpZZ4sHo0CdtuwuMebLQRLmbw8iOzbmYEuzWsWxl6yfzcEkL+Ef4Ynu7foQWH4f0HUjuuDvldEtJCa7214fqzfEh2sKwIgzdmWUn+owSInGXawLXjyoiF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250388; c=relaxed/simple;
	bh=ARPCXqlwCBJMUXEwjdLiVkMGRTuC0dmsfvhg0FhPEe0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=T2//6E6Pvk0L9oIjiuTtMFmV/1L9EhQ9vBJVOMj9ObcNHrns976dHWefULnycLnOvldfRehz/8PJYYsc0vv5vH8yBuRy+peYyghpfjnm2Fds+125gGi/Q92XA4Vzu0u5sHA0rXtrM2oNcuQ/C7nt2VhwvggyawoeC6WCiWP1q5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c08g7pCo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c08g7pCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746250384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bnJD9G73fbpRUlEOK4ZPbyIgsAPRcqipZ4h3oefl+7Y=;
	b=c08g7pCow60zuYAjjlyLHwGEJOhMdRxpCLVFhcKKo48uiHnnQwNfTjx4c6g2DVeZZN/JNu
	QwtWErgQPFNIU/zmRauLa2OE/PK8ive8Em+Bb/ISUqt3eU75nbCaL5/GnaTI6KKkACjTLA
	zLZupPzW3MO63sa00djpqAjdcgRKbK0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-dF9HYBuqMZCdhmbQalY68Q-1; Sat,
 03 May 2025 01:33:03 -0400
X-MC-Unique: dF9HYBuqMZCdhmbQalY68Q-1
X-Mimecast-MFC-AGG-ID: dF9HYBuqMZCdhmbQalY68Q_1746250382
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E97D19560A0
	for <llvm@lists.linux.dev>; Sat,  3 May 2025 05:33:02 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF80B1800352;
	Sat,  3 May 2025 05:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, 95d3481a)
Date: Sat, 03 May 2025 05:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <74119.125050301330300139@us-mta-176.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UPSvF3ylcu-NXDnnMqJRdQh5mGSA9nsy65LHb9pRQTk_1746250382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.15-rc4' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1798376387

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1798376387-x86_64-kernel-debug


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

