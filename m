Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1D381AF
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 23:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736119389; cv=none; b=jAHLpmCiWDx5NmcNThcPJ4OFiljcvvsIkGSOawCd8lQIHa2gK1IotIgYRkLRj7eh57R6NU9wfAOlCysmReUNfrIjlK7hFceKl3aQc4+jv5OuQW4IkaVSDfAePQtxkgL3c3KetfxWtSE8yHo1GGBhnZNdImmC8Fb64frFY0cpW64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736119389; c=relaxed/simple;
	bh=KUuUNyr7YmlLGaeXf4Dh5Hw5si+6BM4vIxWlYOv4DgE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Fn6pAJ7UkVqhemIRt+CFInZMdtMhrec0KAtlrVmyY3Gz86E4b8geH7elodHIlW6IOnt49JXbM4hsB2dNncIxj5W4/zMBqq02y3przAwFsGBHXV7o2eCm+KaoH2kIkir7RBnR4ql4Vu/XsbbCoNw3QaqDqv8whvaTWH+PBJTOvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWdxhW3/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWdxhW3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736119386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tmHH0O/C7j9O81nEYp3wmPf3FZpwVij781xHbNBud6I=;
	b=BWdxhW3/2JM1E+MWcD9g1V7TsfsISo7VDKWe1LfB8Qmvc7Za2gNPwRUswPRIQ6lyLBbO+E
	MJ7lA+0U6EP/ko26Pm61NdDa5mR5wou7wSXkadhQ+3HEB0SuPWtSOa1DzvhQrw64UIjyHD
	1pQrOXdT5PPwPRwG090MEQCRfusWnj4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-uTuVVy-dMriGvenuhihwiA-1; Sun,
 05 Jan 2025 18:23:04 -0500
X-MC-Unique: uTuVVy-dMriGvenuhihwiA-1
X-Mimecast-MFC-AGG-ID: uTuVVy-dMriGvenuhihwiA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAF4E19560B3
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 23:23:03 +0000 (UTC)
Received: from [172.64.12.6] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94D603000197;
	Sun,  5 Jan 2025 23:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 9d895519)
Date: Sun, 05 Jan 2025 23:23:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <40908.125010518230400218@us-mta-557.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MObN-lqdsBEPJPDDmX2stgJseqAarp96So0Ir4BOs1M_1736119384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.13-rc6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1612227562

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1612227562-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1612227562-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1612227562-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

