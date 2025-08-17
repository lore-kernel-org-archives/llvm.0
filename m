Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D4645
	for <llvm@lists.linux.dev>; Sun, 17 Aug 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755390734; cv=none; b=AbgSwOCo0q4pKHGHHhDpyxS6m1PIt2+DS6YYajDB25thecV7h/nJpQ19w/51VaOR7V1D8cyFgrYcoOiyhm0Z5BnoetS6rO2SYnxCvlM2egGto8gblRuRXvfi8tcwasPsW9WNn0I9NMJpWSa0+15G9D+7EUkspoLTdPCJ1ShL1Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755390734; c=relaxed/simple;
	bh=2wI/ia2UKyTJEOY6BnOmNg4F1SH/xmjz1RTXqqVboso=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=My/cwuEvJe0UI/gLsHrIcVsnAdc9Dtx0Egb6sQPdUxjDs+UZnggdE8jkOzTwyIs9+4x3VhVwiDpXPvmtPikPrX55HznhcbwHTNIj6qBbmJYAiIbnX667LIdGtt2oYg/bwowe2ppndRaNBem9uP6Mosftr16z3QxruezpgcVbPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKwrnevp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKwrnevp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755390730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nCpGGDurUdK6g9emq6VGoQQnG/5iJ164aKiB7n48Hmk=;
	b=OKwrnevps7DvXxEnEf3QZddBKT6FQKfLvyRx6xwCrn/vE+7IhfIvP063Pl0hJVoO3VtaVL
	RurFgfEIaCAN1N2u5Ia0nDOu84GN+jZWbS5iPxmu6ZKxq4PHLOxS/VPYPOSf9bbYz0kIut
	VQj85NRwWI7sQQ+LQwg9QKhIMeli42A=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-246-cAHtZgNjPEWs-qm5paYkOQ-1; Sat,
 16 Aug 2025 20:32:07 -0400
X-MC-Unique: cAHtZgNjPEWs-qm5paYkOQ-1
X-Mimecast-MFC-AGG-ID: cAHtZgNjPEWs-qm5paYkOQ_1755390726
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8612218003FD
	for <llvm@lists.linux.dev>; Sun, 17 Aug 2025 00:32:06 +0000 (UTC)
Received: from [172.20.84.71] (unknown [10.30.45.119])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14560180047F;
	Sun, 17 Aug 2025 00:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc1,
 upstream-mainline, 99bade34)
Date: Sun, 17 Aug 2025 00:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <08693.125081620320700571@us-mta-246.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kmr7-pu9bB6X7cyhXgIIuTdrX1GCBT3zutSCVRG69kU_1755390726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-fixes-6.17' of git://git.kernel.org/pub=
/scm/linux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1987620236

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1987620236_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1987620236_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1987620236_x86_64_kernel-debug


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

