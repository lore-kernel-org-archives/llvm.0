Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BAC18DB1F
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 05:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165335; cv=none; b=g9Li5GI0t8bvN9KdbMEh4gYgK2Bb8fm50dD0AQG7O3bTiXn9AMvsRgrOdIv4AitkjRCMIc/fxIGG74qUpuwjDYUJcYuo2SEg5mUt6k+wH+PdB0Dy9Q9l4bAtwjjYbu7eTfvcLEL8nrc9fIFQXTHn+duAKhHmbL4CLdHVAkORpss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165335; c=relaxed/simple;
	bh=H3T+kqK0iVeeGgyVF1Mt88SGxcX7wijknJJCeyUietw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=g8HW1QsTM9gGKnjAt16okafp7FBHdU65OH76Qk80Nb1GPbaO6QgBqqXOq769H56n+IHdMEc06iSPFjHRA+1Z/qUJ68bww9Dpevl7+cui45Vlz9LOPe6sdjcxLlYrc2g+J5AixAhOEjvcUgM8g6JzZxCBUy3NSPoyEA21PfsCvAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6lJYg56; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6lJYg56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786165332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dc5KbohqXwNWBgvOvgHz2Zyq8LInugli5at5LGL39XI=;
	b=e6lJYg56JTIGWehXCAnAkrTmY3HVqmhVJbZ90JBF/4crIO1t+NPTKh2BhkkWG5cDNJQNMF
	5tLMs5Nkf5OZB/CwrbtMq0g7ElMIyy+cjU/ucbrqDr2eGvveb31UBjryXOhPvkzzEF5nqb
	kDNhzG2Ud9V5kRweNB+deOZ+5p96VaA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-lbCx6NNlNuSPABZbyTjsaQ-1; Sat,
 08 Aug 2026 01:02:07 -0400
X-MC-Unique: lbCx6NNlNuSPABZbyTjsaQ-1
X-Mimecast-MFC-AGG-ID: lbCx6NNlNuSPABZbyTjsaQ_1786165327
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC25C19560B4
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 05:02:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 682B51800347;
	Sat,  8 Aug 2026 05:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-rc6, upstream-mainline, 7cbe91a4)
Date: Sat, 08 Aug 2026 05:02:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <07774.126080801020800105@us-mta-332.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QOiBkg2fJc_DwKVuPayIns2221a_kTG89dg41W0cF2Y_1786165327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'thermal-7.2-rc7' of git://git.kernel.org/pub=
/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2741312633

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

