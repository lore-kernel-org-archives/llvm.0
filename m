Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482537BE62
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774534371; cv=none; b=mVpkGnMbrawRY5zmjedreHxo/s8rjBPV/3B8OVRU6TdRjC+JwBMUJfj8i+6tFVOIn/XpeTRcja3i+1SU2CNCbpNeIxJ6uCxkXejFq+n3tBSJ0xiHAox/O7pzsaKvVDdZ0zkzJw/m69wTghQ1pFicth7feFruTBZVs0ZOC2mhn+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774534371; c=relaxed/simple;
	bh=YnyssR1U8+X9y1SYl1GJU4frL0DYNZQZvVabQEvijyQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CJinx8yGsCVStjlMpH4pQ13B8jxx63mhRebCcsIWdw2eWx8HyRweR13LC9g+Ll/dSyKf7laI0b8iehOu3Cu/mmlLuicvDMkyRiZpMkSx5poHT1dqkGzPpvp+z346+CyYmvnYBX1UgkkxyPkdc0NMRvzaveErXVy3G+BVLz1X/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwG8zcva; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwG8zcva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774534366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J9JzYG5INSc4ONlKnu1I/1h2X1tCA/lHVwZLWmQvpvo=;
	b=QwG8zcvapM9iawXJ5qFhgoRuDvVLedKapLToLcSkqkvLIOdT8jo0e1cgO13+zWScdcjkdL
	WzAkgLrzx38H0G9fFtmZ6arik/8XGK0JFQSdDBhuxhN1Ftr8gkJ2ZyVQr76lEorw6vJMVr
	YhbnCR2y2oWuEV7xWxIR/0gxV2r8/Mc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-TD0GdB15NfSpBAVmHH3Bsg-1; Thu,
 26 Mar 2026 10:12:43 -0400
X-MC-Unique: TD0GdB15NfSpBAVmHH3Bsg-1
X-Mimecast-MFC-AGG-ID: TD0GdB15NfSpBAVmHH3Bsg_1774534362
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5AB98195608E
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 14:12:42 +0000 (UTC)
Received: from [172.20.168.233] (unknown [10.30.45.63])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0D8D71800351;
	Thu, 26 Mar 2026 14:12:41 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc5,
 upstream-mainline, 0138af24)
Date: Thu, 26 Mar 2026 14:12:41 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <59275.126032610124300461@us-mta-210.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BGFD_4joDMzRTth0Tupy07ze8z4JbDc2-Ip2ptfj8DA_1774534362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'erofs-for-7.0-rc6-fixes' of git://git.kernel=
.org/pub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2409730716

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2409730716_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

