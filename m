Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41DC1C687
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360084; cv=none; b=eK8M6tGDvsPr2i0ajgDjq4vewfKo6aM5UIuhBpSPy5DH7gQxnPaXNQsPrLtk9MwYyMyafyTg3ygIOWNGs8PppeoON4inRqSs0h5M/Vv/GOfz1nFftQinUQrveLek4zfHTpPCp10rRJoyXB+RomiLNojm2U78mg0jaAABv0HZKpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360084; c=relaxed/simple;
	bh=GNQboEDvo7UQRV3RMlFDsAGQjDShLJiY/VZxtWnVkCY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UZ02F1Tkka4VWgQvOR01sOoCTQMleP0F1b0yRszTZ/QL+xVw5/5yNit1ZpQAiTx0kSrHeSAva7oUex0n1LnaRXRFz3LS4OSzjcMiov7waDzaKwPhB3HXVPKgps1ZmJcQTfXWY+Bp4d4M+wi2OzUMc0QUGGk+tUsyrqiQ9+Eavow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rdc7Xv0Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rdc7Xv0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KJlsBhtxVlVmr5qsFHWDqJSV8HT0+CPIoa9as/btTB8=;
	b=Rdc7Xv0ZBN4E9UB+CmsWrcMdldIZjuHTz2hBc92jQh0OtmTlLmROKRcH3I/syg2IFsE4ph
	L6RTCqdTh71EYFHn1+GCWc7gXniQIfp3dmoPM/zxd3WSaAQATpZqditAJAJ0DVneZwtjzj
	AfWGTCmxLCzGMeXBBLnhdvbNqMoExtY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-vmFWxXvcPaO_CbkFDNplBA-1; Thu,
 26 Sep 2024 10:14:39 -0400
X-MC-Unique: vmFWxXvcPaO_CbkFDNplBA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF42919371E3
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:38 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E3EC1979060;
	Thu, 26 Sep 2024 14:14:38 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 39b3f4e0)
Date: Thu, 26 Sep 2024 14:14:38 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <23885.124092610143901635@us-mta-52.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hardening-v6.12-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/kees/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1458519582

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458519582-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458519582-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1458519582-x86_64-kernel-debug


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

