Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3071D555
	for <llvm@lists.linux.dev>; Sun,  4 May 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746382931; cv=none; b=BPIVoPUy0rto8SyDi9lQpa4FUSX+1s+AYjTS6CgsbTq/wpkme0TOREfLBTyD+lVr1tqxTPzxzfz/qrfGE6vxzoL1Q5I6Dp/KpLmxwDgXOunLOTt2nvsyGSR+JiUPxyGRYviTTu1hWa6e/kN1A+4OzGv/spW9d1/4n9nJjGFuUZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746382931; c=relaxed/simple;
	bh=b+6jOKtCEI0IF4qS4tsu2La9qPvQycmbX9Xaa0pBH7g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=P7Nz2NYc9t+J9Oo1i0bPGJTsNNVCwIR8hsODS8sU92YTflpd69c8o0h9aDnBZzf8YcC36OWI9uYVtWTtigLPcM8z85ynkTtQeBeapWO8H/HWmC/d3ejNMgfjWADMyN5z3wFRDNRlsEvB7d3FH9cQmI/TKgUI8+txn4WG4XMzywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eWkXYfTd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eWkXYfTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746382928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qo8EPy9HxapCHJY7akm+TkFzOyQFzzmPqxsbiajsZgk=;
	b=eWkXYfTday6vGFLYAgUSmamiHRnjl3dYNLIfRcpJGo0fUgWrUe3iXgzeaPS1Pyor+VuRoX
	i5Ldzkug9v820O/heUbNsLUmnZEuahtblC+IxogUNchxul7vD06/gPme/dQVzW2knYh6of
	uj1HuQzJVGU6nhQ7WRtGYM6p6EE+yno=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-P0xvk0CLP8KHUzJoDJdYDA-1; Sun,
 04 May 2025 14:22:06 -0400
X-MC-Unique: P0xvk0CLP8KHUzJoDJdYDA-1
X-Mimecast-MFC-AGG-ID: P0xvk0CLP8KHUzJoDJdYDA_1746382925
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E31E1800263
	for <llvm@lists.linux.dev>; Sun,  4 May 2025 18:22:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF02D19560A3;
	Sun,  4 May 2025 18:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc4,
 upstream-mainline, 593bde4c)
Date: Sun, 04 May 2025 18:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <38468.125050414220601318@us-mta-479.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: atP5HNd6u1L5xAzyi4azn2JbWjx9LnqZrvp9kCS2nfo_1746382925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'parisc-for-6.15-rc5' of git://git.kernel.org=
/pub/scm/linux/kernel/git/deller/parisc-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1799512694

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1799512694-x86_64-kernel-debug


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

