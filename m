Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5576E13A26F
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730922790; cv=none; b=tlcGsTXfLNiqDoquLsx+uaxGTQdQMyV1PBxk2MkhT3DiozfqVy+rAgO99XkmVc/ty6OTuDkTz1cYS7ATgJd9e73v8u5fr3YO46IG43QP1wzub6Xyv/lICRh8riOUn9LXf811ackWgtSnYEm095Wl3Isg8O9To+QfqUlxcbkJ2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730922790; c=relaxed/simple;
	bh=/8m29dc2lH154I5bg03r5Ja1LIOiWcJiwSyfiip3kjw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aVyzi/SnVmLokwosyVQgt2l5ZXiv6+T9bSmZ4q114RcaZMRJ5MPeMuGwQcx1o4+cR4DQkFAmxKt0p6id3RfKAP7gNwsY8L0bRTMvqlk52dMqTCtuWNDZYC/mK9iEpzdoENJBDNhpJVJlCfXneDIpZKajj67/RXzXsFQ8ApHx3Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KInKYxO8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KInKYxO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730922784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PCApfgQTUX9GxLnKMkdK+UW2q2YoM+ve/CM0LV5dWvU=;
	b=KInKYxO8usAjnvSUk/kKCqMWW8RuNVx7aroP7Wdc5k9wc6elewqPQqLffKDc8vwZvQQmAg
	A2QdO0hDek1cHs8Xr9LeHMc9jiBKEKcd2HzniJXNPTscInZfo9rb7pMdJYmp+kMS9oFRQm
	ErKzvujVs7bWh1WfI66Hxwr/+H0hPAo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-p4IW_O-1PTq_tLnmDsot3A-1; Wed,
 06 Nov 2024 14:53:02 -0500
X-MC-Unique: p4IW_O-1PTq_tLnmDsot3A-1
X-Mimecast-MFC-AGG-ID: p4IW_O-1PTq_tLnmDsot3A
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB64B195609F
	for <llvm@lists.linux.dev>; Wed,  6 Nov 2024 19:53:01 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74C6119541A5;
	Wed,  6 Nov 2024 19:53:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 7758b206)
Date: Wed, 06 Nov 2024 19:53:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <15945.124110614530202411@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KX9Ct0vUo6tQRC1dai5TkobrKgu-fMmsA2TxRgmRkr8_1730922782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'tracefs-v6.12-rc6' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1530278259

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1530278259-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1530278259-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1530278259-x86_64-kernel-debug


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

