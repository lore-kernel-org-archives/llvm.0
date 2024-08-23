Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984E452F71
	for <llvm@lists.linux.dev>; Fri, 23 Aug 2024 04:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388131; cv=none; b=B0YAKzY3i+/sk4QcOCnqQyaJXKq/VmWrk9Grw+9Q+ksGEJ4bswvXPwteY5r+byQAb6b5dDj0+nIeCyfd+wtyvqBImqI4kmpPj2dXY63T+Yf1iIgTsl+sFTY/rflo5um3YZ0rlTknZH7vrzvZHuP5JyhnQIEWBIf3KDb+ID+4/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388131; c=relaxed/simple;
	bh=gv2YjVU503ItGJ8qw6H8Y8oXCoVNKcLCgmFsb05ePhU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hbdeh6vSR753A5L+FL7YsUsXLTrwtJWMGkPiOp8N7v98WkeA63M2jX/yRBzKb1yArqT2i37VbqDWIpyVUrEGdLlFXI20ewOF6iVK6gKYKcSJptmiHNADBgFSnsoKuOYAQ+nIOBSsWj+JwEJDMNbyG+Hf08PDevcO2Onuxwh4Ekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lo2Yq39H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lo2Yq39H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724388128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ajtbj3dyUxWMbwymgzDED4ZIbjG/yyV3qj5nkQGefC4=;
	b=Lo2Yq39HBxtHhLrDWDQR7zHAbA8wwYld/3CtL56afuU2fpR/XLLmhaGiYq4Rs1MpOvZC9S
	HWylAv7LVHhvhPh18zUClTjqTvltn6T+ZlGpRAlum83ywcSpS74K0yVzkBKktyc3qByYxu
	8n8e7Q7E4Fq0ET1MiKA+MRCk3FYfu18=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-VFjMY3JwM8OEwHBgqP6hsg-1; Fri,
 23 Aug 2024 00:42:06 -0400
X-MC-Unique: VFjMY3JwM8OEwHBgqP6hsg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2407C1955F40
	for <llvm@lists.linux.dev>; Fri, 23 Aug 2024 04:42:06 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93BC21955DD8;
	Fri, 23 Aug 2024 04:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, b78b25f6)
Date: Fri, 23 Aug 2024 04:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <66070.124082300420700119@us-mta-61.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ata-6.11-rc5' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1424146683

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1424146683-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1424146683-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1424146683-x86_64-kernel-debug


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

