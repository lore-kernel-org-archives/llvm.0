Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78A91CA9C
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890931; cv=none; b=TLlz/r/iSMh8Ogbk2m7Xk0hYNGjzBbvpRP7jQhHV1Wyv5sliMZ1mLhHJ0GAWc8TYgMi9jcOyxklfpAil3JmUYqdnwaQNlZIB9AjAi5nTcq2wcKXUMCZLoSrDZJIkV+lKiUzvFOXhuhjyqB9JwQBedSfoSMOpX17CdGh61g9usRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890931; c=relaxed/simple;
	bh=s1fYUhnV0MQZxFl6/KtuY44EGle2x9z+leD8+RtoSjw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EoRHq/CjByi4+SUv1jP+0QmuGSFsnPmTWyE0cWWoeoWobX4MAbxjmVM7OdfxIXo7ic8VJMIeZj93atoNhQySdYC1PW1O3Ev/mq5adR+t26Qodm92MUQrPyMfCcEaHAb/0kMEE4xWofWZXsNPvcKxGn14hwc4OBm7intvtB1e5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiipKLUY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiipKLUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745890928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WSm3qghwnvcHmLQlc4K+4m11QLPnRFpm1P02wq5uxrg=;
	b=PiipKLUYKjXaI0vg965SPnopdeVfOjUZ+bZMadGSEt3e8KZZj/hNQmXMV/F8YWbK5qC0BQ
	72hrG9GfVNgKObfclGj0gwPWtyMHqG3Hkba6kUW1HCco/qwZaqxCOjeuEUtNCJWtPifLs5
	rvJ7nar/gGxvV0r9hccx5UCS7ulDPVU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-cOXIrmQlPOuMr_qspSyAMg-1; Mon,
 28 Apr 2025 21:42:06 -0400
X-MC-Unique: cOXIrmQlPOuMr_qspSyAMg-1
X-Mimecast-MFC-AGG-ID: cOXIrmQlPOuMr_qspSyAMg_1745890925
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9EF019560AE
	for <llvm@lists.linux.dev>; Tue, 29 Apr 2025 01:42:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1CF7819560A3;
	Tue, 29 Apr 2025 01:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, ca91b950)
Date: Tue, 29 Apr 2025 01:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <78368.125042821420600643@us-mta-106.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -EMKRpgTP86H6JaD8Gsn-5i9n3ChUHHSql2wIYS-COQ_1745890925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.15-rc4-ksmbd-server-fixes' of git://git.s=
amba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1791022426

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1791022426-x86_64-kernel-debug


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

