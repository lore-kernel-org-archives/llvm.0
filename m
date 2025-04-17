Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8151A9B5D
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744867330; cv=none; b=WrKjL4OkSx12zbBdbVRgIiB5ANv5yKSiYeRqXe9c3A0uru3gXOOSBtMnlvxKXZ8eQKlv8lXzS8+SJrk2jPIRb3UC5mUnFmOBDjU1l7VVY2ZvaySgGUtPjna1aVnZD7F35U9zsv8X9s4DaOrmdeLklwdn7jtavd8R3h7jsptpurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744867330; c=relaxed/simple;
	bh=OBe8n742pkfLyVdYBGp28QXVULL3INjfHDUmJ1F8ZJ4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=B71O84CYSPm3W4TtpFzOP6NRzBESnG/KS/XgFcw1JtguK+8RC7UidbvQvXzgYjzeEfyEZInNwLbKwufL3qmnuYYxKATCK/G5g76i3sH+1TlvnhWrAMg9UNtAdzr53VPzu2+Nt+43OB/4dnPK6UFHKCq1ZEhZQXkz5DVHlqUxWLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PHcedPn/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PHcedPn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744867327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X9BT+MwOHzMsfVK7L0Xq8qtE3UBb25BZABKOh0g5Lj8=;
	b=PHcedPn/TFn1Q1KmB4UTSGJSYj96qhfsjHDqWyjDxYvQnJeLOvIZ1z4uIVKd9Tm9cnfV1D
	XwS74qEnoP1be8NEIBn9CqT7ruczFZyBj+itHJqZstQQd2tL5NuPigj50ENHpiRyfBXn51
	wRRBUHHHuBIP86aU/nw43LXyAte/iL4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-DAO6RkpXO62oMNy7EmRmQQ-1; Thu,
 17 Apr 2025 01:22:05 -0400
X-MC-Unique: DAO6RkpXO62oMNy7EmRmQQ-1
X-Mimecast-MFC-AGG-ID: DAO6RkpXO62oMNy7EmRmQQ_1744867325
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC02D19560BB
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 05:22:04 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8044D195608D;
	Thu, 17 Apr 2025 05:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, cfb2e2c5)
Date: Thu, 17 Apr 2025 05:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <31776.125041701220500915@us-mta-194.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CBwpU7ZnAbBauG8OSNujfJyTVt_DxSBzOGmKg4o80iQ_1744867325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-hotfixes-stable-2025-04-16-19-59' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1773001462

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1773001462-x86_64-kernel-debug


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

