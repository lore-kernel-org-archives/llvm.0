Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BCBC2FD
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721617332; cv=none; b=OD9lbQbfEheWEVgzpHurNijgXr77XWTMqLEY0S2M/gHKaYcgL3Ja+Gnq7vr3mVIzW5YUG4p85mCY56od3CL8i8i6G5/nhFFaBpVGkCmh4ihkWu2ZhJRFNsc1WrY7SqC+Gd5BlTEiPaaCNElXW8uPWZx2xrsHIN3MfET5y0N9IsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721617332; c=relaxed/simple;
	bh=Tbz/plbG0maCeUcYoaDbdQvz0Vr1gRLjuyqfj0fXg7c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Y4fcL91Sog53ZuhJS+ozCx6CC7WkTEyi5PI3VGcia9KFyx635obWzOpYH7E5H70+yaA396yeDP+OiSO17S8gSFbZrqteGqfPla6ieBpA4rz2xda/Doq5Gv0HMa8yEa+aJAedvXSorEscrfhJoxcCUtz7AT87o7j/K7DN+tsMVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZVsCA7g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZVsCA7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721617328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IZ2jGZq/H8AgOBzerGm/oPQmRhm6+ploOsWXDxZDmJ0=;
	b=ZZVsCA7g1hboJuwianE7dmOFFJwI8uceWzG857U9OGapiszz6zR1Gy5ioPfcY3zh8ubzas
	20J3uTnz0qAHwgoWZkAaupIU1Me8ippAxEUZpwIa0iqvGFrqOtkc0a5MM9nCYycQCcRIMl
	QA83DEHNXDzJrGhnXzTWGr28p9F/3Lw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-onzOtJK6MM-H1VQOsb1bfw-1; Sun,
 21 Jul 2024 23:02:07 -0400
X-MC-Unique: onzOtJK6MM-H1VQOsb1bfw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 823FA1955D48
	for <llvm@lists.linux.dev>; Mon, 22 Jul 2024 03:02:06 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D140E195605A;
	Mon, 22 Jul 2024 03:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 527eff22)
Date: Mon, 22 Jul 2024 03:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <44886.124072123020700516@us-mta-625.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mm-nonmm-stable-2024-07-21-15-07' of git://g=
it.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1382221789

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1382221789-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1382221789-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1382221789-x86_64-kernel-debug


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

