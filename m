Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25FF266EFF
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741875132; cv=none; b=kIQphJk3+tr+84AYsaacbFYlupSw6hksef06wK4WDXs2seKBoI6p1aOKgFQsTrX85aOcpDqLT1IC3wWJCeRywSQ3Rcu5BditBmTJ23r8yBa34DeD6bcx3aSwj5nVAtB4PldPa7aceRtbByeWGXH7oHm7HyLX0MW9jwYnQMA/JjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741875132; c=relaxed/simple;
	bh=MsLeKnHoVF8Y2zEQs7IlvHLseVpV+yGiCc41qgAiZWg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MvPpYpoGlWdL1FuPZ6QrceGmTR9CUwbwQGbAcslQqz0cP+a80wQmSuW32igfas9Drv1w5FcliPwJ/9oBnLdXNJ1QTr3dfH7d0tlqib9JE1GQrA/TsfWwyQqYp/5JG/X7WLTIC3Vb2nLHu4JzYOD0thl9GR3WB8p34GczFHxxXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dh7OVQCe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dh7OVQCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741875128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OcAhyIjbwFD9vskUT1aIqZt2/ogZhpY6pI/2gVPk+1g=;
	b=dh7OVQCe5D0UX17jPaKFip4vQG0rea3OmugWMr8JGtK6m7xnLtBsDVrZCSL2HOpxIBWdhV
	sTKx0vo8+bwr8be5ASalx6km3m0LONVfvjx4E3bpzXKRXqw7Zl/U1WJ3DwsDcGGEDBJeMo
	n5WM1oR6htvxJ2XWQBYDd0f9qGECJhU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-3npKZW7ROV-vxX4iAeLqjQ-1; Thu,
 13 Mar 2025 10:12:07 -0400
X-MC-Unique: 3npKZW7ROV-vxX4iAeLqjQ-1
X-Mimecast-MFC-AGG-ID: 3npKZW7ROV-vxX4iAeLqjQ_1741875126
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA7181800259
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 14:12:06 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8892B19373D7;
	Thu, 13 Mar 2025 14:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, b7f94fcf)
Date: Thu, 13 Mar 2025 14:12:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <32021.125031310120701305@us-mta-332.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9fiWryELw9jFmi2igKGUi2Oa-72_y37yQC3oB2WLDQk_1741875126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.14-rc6-fixes' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1714891413

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1714891413-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1714891413-x86_64-kernel
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

