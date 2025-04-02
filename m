Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3C413635E
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743622930; cv=none; b=SmR8JFcIHII9FL5xecqoRCBF3x3PKwQNPy1V7dJwiMQBHdZG8y5IApvxTGK3feFqZlB0xiyQfwIusflhlxRqpiQdNCnapb9K0lNfEGNMj0IJMQxmCCbiOFMePKy67A3WH8A+/raHvIppLaBLvW1CP4jFWhijLXxHOvTXOZIor3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743622930; c=relaxed/simple;
	bh=+/Bd8crOUXIbLQ4hxpyGht+O3oIgBMYNOdb43VdtOHU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=A8tuBEJPMSy1igikhauGUTxZa44Ose6UQ9jnh60oL5DgkQEe6FTDBWpW1U1bdAZZvXJ5ca18KH8ZuJ5QIWIfEfRfcb7l49eAFZTaDaxDGxwnCK3yFvAljuevaGpBLtQOa9soAQXikgz/5+9GWX7rD9pPEXaKMFBjdULxrCVsRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScLrOjMr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScLrOjMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743622928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHrno5IR7JmhwAECVTrqjDXlrU9VEU+3Rz+fqm0zw/c=;
	b=ScLrOjMrDhfL+Vdxl7bdzPxFzFcndm4WDGHktPYljl5/iw62Xf44Q42nmQ3xD2p+IdG759
	5eh5XTANufjBMQhelPNWc+RPSviO6Y54BVgJx957xh1oYSENJNKA15I6D/gYuc5OWqII7j
	HgmZWc/JNw7KVh2e/n5C/vefrTQSRjk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-cnicg1OGMxC9btbc-DKe6w-1; Wed,
 02 Apr 2025 15:42:06 -0400
X-MC-Unique: cnicg1OGMxC9btbc-DKe6w-1
X-Mimecast-MFC-AGG-ID: cnicg1OGMxC9btbc-DKe6w_1743622926
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DAAEA1801A00
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 19:42:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E77C3001D0E;
	Wed,  2 Apr 2025 19:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 92b71bef)
Date: Wed, 02 Apr 2025 19:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <84325.125040215420600665@us-mta-573.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OvM_0mzXh6wfffikScqCOV6JUQdaL85uWEN11ARy-7w_1743622926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'objtool-urgent-2025-04-01' of git://git.kern=
el.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1749166983

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1749166983-x86_64-kernel-debug


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

