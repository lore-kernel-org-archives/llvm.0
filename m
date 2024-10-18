Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF22022C5
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729266132; cv=none; b=QbaDX8kVu54J/GfHlnD8vTmGKgQUzkxe44rObbzDzN1KVRpgMbVJXOOD31zp0Vyn7uTEwzsM67xY/kQsKgG2l+4gUfKjEA6aPYjCvmqX8739FYZWZSBeeNGkiaF3qDyvkVKn+qPrMqh2CpUMq0UIzAHDGdkQ2wG9AIS2/DIeqWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729266132; c=relaxed/simple;
	bh=lQQrd3nmzn8jS6xIJAqfqEd9GGByhDuTfSbJ9vdY1RM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mfDsk9tiFVRUS7znJk2lgIMGP88bhP+2Bpzc867+8BCtXSm0jg3J4CZue4iOpTl07mqRGivPaXG3qodarGm7mSShwazwDaFVe2KPmr2Tw3lM1D5UhEfgJXaeDGzNl1dpnJ6suBcl3AnS+UgHn99VNVvkHUh6N7prz6iNrRYUhl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEqh4gVm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEqh4gVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729266129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5uw+E50k6DBzveXGxmIk6KR5q29N9E2EOw/MKydJdU8=;
	b=XEqh4gVmIyhbo8j0TXlZUXZjx+RLjfAcCMKwHtb/UpT190YWvfL+5V4sYc2W2zj9dWH3z7
	KMUq7QMV+97Y5MeRoL/LO5SpQiSv7Zt4ZPBunYNOY+AftsfCTij93/BbqLtNiTPhJLmF5p
	OeRgTjPZytZzgYPk4+hVeUldKD41uas=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-nDoQ1IqCMJGroafxrKLTbQ-1; Fri,
 18 Oct 2024 11:42:08 -0400
X-MC-Unique: nDoQ1IqCMJGroafxrKLTbQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 138F51955F3C
	for <llvm@lists.linux.dev>; Fri, 18 Oct 2024 15:42:07 +0000 (UTC)
Received: from [172.64.5.43] (unknown [10.30.32.29])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B599C19560A3;
	Fri, 18 Oct 2024 15:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, ade8ff3b)
Date: Fri, 18 Oct 2024 15:42:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <67235.124101811420800405@us-mta-683.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_bugs_post_ibpb' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1502341128

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502341128-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1502341128-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1502341128-x86_64-kernel-debug


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

