Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F473C2D
	for <llvm@lists.linux.dev>; Sun,  2 Aug 2026 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785711791; cv=none; b=OdQGz5bb/OHJX9x2kpvUYYXKr5zRoWk+Mwma4DIZTBTjdiK8oXrWxh58cEDU2AqDOo1Z7TZie7GcMHC+AezI7T/+zWo5mgpXHYcTxEzn0DNEhSbX6xaoW9wDibBAJH+/PhlvBxR+WqcnpPOpqhYJZSWkjCm3MmKkZEeB+rgqshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785711791; c=relaxed/simple;
	bh=Iued9qERhziAEIijM1BY5jhnGPV/BNTmdbbzrImSY+0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PLFrR8xL9Vev9DLijdRqUqOBtXWpR0HrPD9CwdbpIcz9ftV+2iEmMBH/TzVKaOzRDBjKmI4dFzFXDDoXYrgoQsq8RjTjlD4z8UchaK05XbzHEY329sq/WPufHVYdzJ/DmE32agrl2ljVuoLgRU524vH6QYOGvalqo8sys3D1Uco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHSNv6do; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHSNv6do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785711788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5WhUydFlw36LIh9X+hB3HAddENDxuY726syAGkFGVco=;
	b=BHSNv6doc9Mze2r2jwGsBlKNL2SUQaUf9a3J+xRVJSCmWlIekZI81wRK6drsDNe/HHmDlM
	e9W3pp8NGEwPSTP1KModMPEFONnjQ2CBDeOHMLR+SOHPL6YP1DXLsIjUw/F+hzfdQtge8u
	mHG3jknloo2kOIrE3w0avfqGKJU5FPc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-d-8NWZarNCCA2rI1uwvY2A-1; Sun,
 02 Aug 2026 19:03:04 -0400
X-MC-Unique: d-8NWZarNCCA2rI1uwvY2A-1
X-Mimecast-MFC-AGG-ID: d-8NWZarNCCA2rI1uwvY2A_1785711784
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D75771944B2F
	for <llvm@lists.linux.dev>; Sun,  2 Aug 2026 23:03:03 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72EA130001A2;
	Sun,  2 Aug 2026 23:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.2.0-rc5,
 upstream-mainline, f5a7e2ae)
Date: Sun, 02 Aug 2026 23:03:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <73296.126080219030400499@us-mta-612.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aYfuuDFWb4ab9MmFBbWjG37In9sDU_r-tGF2oJNTnYk_1785711784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'riscv-for-linus-7.2-rc6' of git://git.kernel=
.org/pub/scm/linux/kernel/git/riscv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2725517974


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

