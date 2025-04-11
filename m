Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E222367D0
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392191; cv=none; b=IZ3jsF10qrU6KuAINYv0PBw0l3MkLlzo83cF+zEPY8f3ziyLD5JEAVm+rrQ1mXd+qr/Q0n2qhjcRozQk1PX+88qFelgD+mq8K/pv65Jj7AMl9iYWNoJbF74EAgY0MNQOLQibuzcCDjyaE4/qjmo7kpyWNAlxhfozpWhL/pRJcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392191; c=relaxed/simple;
	bh=Qip8NnGwc5qBGNe/87vrQShX+G+7k7uhl4ssXUxxx48=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ldqkLigFyregTZaiWClp3iiQHFZ3ytr9lbhlLLYaHLk1FdaWzjT0OM8wvjZ1ZT9lObXYjvySjspOuZV8nltDE+nK23I7sSeuGtbgLfaka2xBnGvlrkFfpZiv2BLwg5kBvBLhPyNYhcyPEq9O63Kxl/AnyFCxxsuCxHix8ukRuFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6rPUHpz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6rPUHpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744392188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICVGkJesJJahruFdeXveeUsMjwq7LMa32yLHexYWOg4=;
	b=c6rPUHpzQJ0s+qowIsQeRYEj/tjqZgo2p27wvXqUZtfpaaHKhQo3kK48EOaMshOdP6n9qU
	kckRfA+diNXeD+5hm6z1WDq7guGg5phqt36V3fsUSoXq9UCwUaGbDCmY+JprFWPfljqnqV
	EDK3ZOMN9W2I16OZ97MayNBGxk05Qsc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-jSG6XcOlNNOOkaXoCYf7kQ-1; Fri,
 11 Apr 2025 13:23:06 -0400
X-MC-Unique: jSG6XcOlNNOOkaXoCYf7kQ-1
X-Mimecast-MFC-AGG-ID: jSG6XcOlNNOOkaXoCYf7kQ_1744392185
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A82301800260
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 17:23:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 253B11808882;
	Fri, 11 Apr 2025 17:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, e618ee89)
Date: Fri, 11 Apr 2025 17:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <99937.125041113230601481@us-mta-85.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v7uCBTAoXESuez71-hfBskqI1QGp3OGJkTCSAbr3kR0_1744392185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.15-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1764632593

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1764632593-x86_64-kernel-debug


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

