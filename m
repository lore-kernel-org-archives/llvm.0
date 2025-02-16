Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F991531E8
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739743929; cv=none; b=nVuMr16fzJqbRz1W3wys05q2SrnEsGSUwSBR5ZeotYTlixTZn8JBiy2Xl5SfAovu7I4t4a9s7CUMM7OGXwxRU8DSruih+zZU0NPG4XPcT2+L/u+UconUgAwTd/qUS0gBKLUzij3zoxJ9TQzX3BB9yi/1fcUFgc0tJtbq5uC//xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739743929; c=relaxed/simple;
	bh=bfktVvsapOEo5UPOXm1vN7M09GtiBPoXOSFTDedgmEA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iIYCWQGQVXoF1GiIm63E7vIIW9HaJV72nw7mBV4nU7zRXaz/9zCNr+OvozOkvNPumTvSEAFJTMc4+NAlnlMYVH8oortoHe/q+AZBfFIjAa7OvmwizqpTVA0//3k0Al/egscal6tUwyx6GL1BegsPjhvigdIVBIIvkCVL2Vj+MAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixbyt+qp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixbyt+qp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739743925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MgBxZ55Ng/m+38y9VmoY6mN6XGqFFWWuG7EiJVd9Qmc=;
	b=ixbyt+qpteP45ZUGxUFTNNvJdWI3fBCukWFqIIn9Dvx3iSNjIpJkN4mJqxxeFsy0S6G3Fs
	wK3SF2V+3uwIJO23TFcTIb47KKHuMOXm040kHy3RjePSqhvtTFmsIAvhRUrMtKhi8HcSKn
	tEAr+BfHPC8UP02BC1xNHDStDeKm3tc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-s1t5SvdbPKafbq7rNy_L4w-1; Sun,
 16 Feb 2025 17:12:04 -0500
X-MC-Unique: s1t5SvdbPKafbq7rNy_L4w-1
X-Mimecast-MFC-AGG-ID: s1t5SvdbPKafbq7rNy_L4w_1739743923
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD97618004A7
	for <llvm@lists.linux.dev>; Sun, 16 Feb 2025 22:12:03 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 51ADD1800365;
	Sun, 16 Feb 2025 22:12:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 224e7451)
Date: Sun, 16 Feb 2025 22:12:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <86982.125021617120400165@us-mta-500.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7_ITwdgXjJBKKRPTkP7253A9kMNtMQHO2OlS9Zt3p3s_1739743923
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.14-2' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1673570050

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1673570050-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1673570050-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1673570050-x86_64-kernel
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

