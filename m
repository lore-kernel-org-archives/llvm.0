Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6C1372
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 23:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746831789; cv=none; b=IPlAjKCyjIDdGEC3UemXsBuUfYNjpnQjphhUdjC+bfvrIwq6Ln5bW7+xZP+Rj5VxRN4SllU7Yq6gBhIgeQiRPKDFFoUjoN8N+B8gBxjRzx/zOfX6mIOjkwzLbDGgRUmlDtqVpERmJaJ0K5EG5nbQFzEIFyyJqcxLoVgYYii+Tvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746831789; c=relaxed/simple;
	bh=aGDrreVeCZDyhsdwTC8i1SbQteK+PpBXgS2eN1apcZc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Vpf2e8PivKHJnmvnkH+FWbhM5VplcHhCxR1Q5Bp648I1/V+ydKR8n+Y/fABFne+TDv17EG3BOoEnSgkxPtUGPQkARFUnjO4rLhLna5AspwnLIAvDprJ/KxcnJFWSQSWl62amK9D7RbGb3hz5VrdWyOKm9GLGiB3uCt8wcleo/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbjsC4Z7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbjsC4Z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746831786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VmUv5wx04fv3iymfi5moLTLaHGYKZ/3IvuFKHK2ptd0=;
	b=DbjsC4Z7TDdya/sjzlvml9jjne0E5QragnvVi5SncgvV69qNNmpIAT9ejHwdSnwISokMIU
	KCvuGP4WsVc74+CSHoZZkgixjVmIP9H+orqetPPZ6eOVh5FTzoBVnlIwXwPvKkoWMwpIBN
	dcPFnQkVxkGBpkfcl8MXd3N7TlmpvMw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-TABn8ZeJM3OaFn-en7WSeQ-1; Fri,
 09 May 2025 19:03:04 -0400
X-MC-Unique: TABn8ZeJM3OaFn-en7WSeQ-1
X-Mimecast-MFC-AGG-ID: TABn8ZeJM3OaFn-en7WSeQ_1746831784
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFD1E195607B
	for <llvm@lists.linux.dev>; Fri,  9 May 2025 23:03:03 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 610701953B8B;
	Fri,  9 May 2025 23:03:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, ea34704d)
Date: Fri, 09 May 2025 23:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <55035.125050919030500109@us-mta-68.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DqPHRUJ9D0jY1GTPQRVgnvo2Bg44AvuSISYBNb0wiF4_1746831784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-05-10' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1810089785

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1810089785-x86_64-kernel-debug


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

