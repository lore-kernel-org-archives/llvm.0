Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82117149C7B
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178790; cv=none; b=nC7/4SPRkbl0ow05cUGJrS+8qyB9BhY7s2dDYu6qDP0zKNxeUat74CDyt3eDkyz3vA9UNgPwbE3ycf7/VXtxf3hRwmsWwdGO9ur8gCPP949oPgvdHSQnNRWkfRbJjCAbb9wW8zDjrQcqvI4c7I7iMCdDKBCz1ZEdiKeAS7b0Qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178790; c=relaxed/simple;
	bh=BYNH9bJ+bW0BzvC490EKO6MHlbOHqvmxoBtUcw9b44Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HHK2yATNOoHTXlvMBdsp9Mx5ZVm8/M3wWd4dPxcXDwbHd2LkQqM1Z9ONWo7cPWWOQfLadMtyx9wOjRurY3cVfpgjgDeXCqJdv0JFjZWEdSL0OpnYG6uMBsR8x/umbRCEoqCuIcvJWyaBKeww/25iO8xm/FDCuTfbUYwcpfrkVVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BZsJtNp0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BZsJtNp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736178787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d6vmyWhOesiYsvmIgBleF2+0Ml7RBq15X68BbtSiJIg=;
	b=BZsJtNp0Qrb67AZ65hiH8Fx9g362VyXLoxim1hR1Pe5hkLFI/QH7Ynyvo3sNowcxYW9eMd
	LBc29ZYn5zZOg3FyuVggR0u9gXIBhwl5imd0RY4oFXyMbN/B4uqz1hXabbiLl4m1oxzGbg
	3sXnvjH7B1MW6uujlt56I4d9ydA27uk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-Sln5GKPXOKSUcri8-FoZDw-1; Mon,
 06 Jan 2025 10:53:05 -0500
X-MC-Unique: Sln5GKPXOKSUcri8-FoZDw-1
X-Mimecast-MFC-AGG-ID: Sln5GKPXOKSUcri8-FoZDw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C01BD19560B6
	for <llvm@lists.linux.dev>; Mon,  6 Jan 2025 15:53:03 +0000 (UTC)
Received: from [172.64.11.15] (unknown [10.30.34.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 59E4E19560A3;
	Mon,  6 Jan 2025 15:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 5428dc19)
Date: Mon, 06 Jan 2025 15:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <79552.125010610530503238@us-mta-441.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LNKI-wzPtro73_nKe6Q9EziY3BXMfqNmoFymxilQ4fc_1736178784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'exfat-for-6.13-rc7' of git://git.kernel.org/=
pub/scm/linux/kernel/git/linkinjeon/exfat

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1613119307

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1613119307-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1613119307-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1613119307-x86_64-kernel
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

